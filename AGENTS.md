# Agent Instructions for Storefront

Storefront is a Dreamcatcher feature-first repository. Future agents should treat `features/*.feature` as the desired behavior contract and keep implementation details subordinate to those features.

## Doctrine

- Storefront is an agent procurement surface, not a human marketing funnel.
- Every store card must be inspectable by a principal-serving agent.
- Prefer evidence, alternatives, receipts, and clear authority boundaries over persuasion.
- Show verified burn when burn is used to justify fair software pricing.
- Keep clean-room inspection/work distinct from unrestricted source access.
- Do not hide sponsored placement, Dreamcatcher ownership, referral payments, maturity state, or certification status.
- Do not imply an agent can spend, sign, purchase, disclose, or trigger real-world actions without authority, approval, and Conscience gates.

## Development rules

1. Add or update `.feature` files before implementation.
2. Keep feature files flat under `features/`.
3. Use only the allowed tags in `scripts/validate_features.py`.
4. Run `python3 scripts/validate_features.py` before committing feature changes.
5. Do not commit secrets, private customer data, raw prompts, unrestricted source for protected modules, or vulnerability details that should only appear in clean-room/auditor scopes.
6. Schemas in `schemas/` are draft contracts. Update docs and features when a schema meaning changes.
7. Reports in `reports/` should record PASS/FAIL/UNKNOWN per scenario with concrete evidence.

## Acceptance posture

A future implementation is not accepted merely because pages render. It must prove that agents can:

- fetch machine-readable cards;
- inspect evidence and alternatives;
- request quotes and receipts;
- see authority/approval requirements;
- compare fair price against verified burn or other value evidence;
- reject, challenge, renew, cancel, or route to a better option;
- preserve provenance and attribution.
