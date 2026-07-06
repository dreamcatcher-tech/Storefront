#!/usr/bin/env python3
"""Validate Storefront's agent-readable feature files.

Checks:
- features/*.feature exists
- tags are from a small allowed vocabulary
- every file has a Feature line
- every Scenario has at least one Given, When, and Then
- feature files are flat under features/
"""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
FEATURE_DIR = ROOT / "features"
ALLOWED_TAGS = {"@directory", "@card", "@agent", "@conscience", "@economics", "@api", "@governance", "@burn"}
STEP_RE = re.compile(r"^\s*(Given|When|Then|And|But)\b")
PRIMARY = {"Given", "When", "Then"}


def validate_file(path: Path) -> list[str]:
    errors: list[str] = []
    lines = path.read_text(encoding="utf-8").splitlines()
    if not any(line.startswith("Feature:") for line in lines):
        errors.append("missing Feature line")

    for line_no, line in enumerate(lines, start=1):
        stripped = line.strip()
        if stripped.startswith("@"):
            for tag in stripped.split():
                if tag not in ALLOWED_TAGS:
                    errors.append(f"line {line_no}: unknown tag {tag}")

    scenarios = [idx for idx, line in enumerate(lines) if line.strip().startswith("Scenario:")]
    if not scenarios:
        errors.append("missing Scenario")
        return errors

    for scenario_idx, start in enumerate(scenarios):
        end = scenarios[scenario_idx + 1] if scenario_idx + 1 < len(scenarios) else len(lines)
        block = lines[start:end]
        primaries = set()
        for line in block:
            match = STEP_RE.match(line)
            if match and match.group(1) in PRIMARY:
                primaries.add(match.group(1))
        missing = PRIMARY - primaries
        if missing:
            errors.append(f"{lines[start].strip()} missing primary steps: {', '.join(sorted(missing))}")
    return errors


def main() -> int:
    if not FEATURE_DIR.exists():
        print("FAIL: features/ directory missing")
        return 1
    nested_features = sorted(p for p in FEATURE_DIR.rglob("*.feature") if p.parent != FEATURE_DIR)
    if nested_features:
        print("FAIL: nested feature files are not allowed:")
        for path in nested_features:
            print(f"- {path.relative_to(ROOT)}")
        return 1
    feature_files = sorted(FEATURE_DIR.glob("*.feature"))
    if not feature_files:
        print("FAIL: no feature files found")
        return 1

    all_errors: list[str] = []
    for path in feature_files:
        for error in validate_file(path):
            all_errors.append(f"{path.relative_to(ROOT)}: {error}")

    if all_errors:
        print("Feature validation failed:")
        for error in all_errors:
            print(f"- {error}")
        return 1

    print(f"Validated {len(feature_files)} feature files with allowed tags: {', '.join(sorted(ALLOWED_TAGS))}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
