#!/usr/bin/env python3
"""Validate that the GitHub Pages site expresses Storefront feature files."""
from pathlib import Path
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / 'site'
DATA = SITE / 'assets' / 'storefront-data.json'
REQUIRED_FILES = [SITE/'index.html', SITE/'styles.css', SITE/'app.js', DATA, ROOT/'.github/workflows/pages.yml']
REQUIRED_SECTIONS = {
    'storefront-entry-paths.feature': 'entry-paths',
    'agent-storefront-cards.feature': 'listings',
    'agent-readable-card-api.feature': 'agent-api',
    'buyer-agent-audit-and-alternatives.feature': 'audit-station',
    'verified-burn-receipts.feature': 'burn-ledger',
    'clean-room-inspection-and-work.feature': 'clean-room',
    'purchase-renewal-and-value-receipts.feature': 'receipt-ledger',
    'network-roles-provenance-and-attribution.feature': 'network-roles',
    'governance-and-trust-labels.feature': 'trust-labels',
    'agent-demand-and-opportunity-mining.feature': 'demand-board',
}
REQUIRED_CARD_FIELDS = ['id','title','type','role','summary','outcome','successDefinition','goodFor','notGoodFor','fulfillmentModes','provider','ownership','sponsorship','maturity','certification','priceModel','price','evidence','alternatives','risks','authority','exit','receiptRefs','api','dreamcatcherRole','contributionDepth','rankReason','recommendation']

def fail(msg: str):
    print(f'FAIL: {msg}')
    return 1

def parse_features():
    result = {}
    for path in sorted((ROOT/'features').glob('*.feature')):
        text = path.read_text(encoding='utf-8')
        feature_match = re.search(r'^Feature:\s*(.+)$', text, re.M)
        scenarios = [m.group(1).strip() for m in re.finditer(r'^\s*Scenario:\s*(.+)$', text, re.M)]
        if not feature_match or not scenarios:
            raise AssertionError(f'{path.name} missing Feature or Scenario')
        result[path.name] = {'feature': feature_match.group(1).strip(), 'scenarios': scenarios}
    return result

def main() -> int:
    missing = [str(path.relative_to(ROOT)) for path in REQUIRED_FILES if not path.exists()]
    if missing:
        return fail('missing required site files: ' + ', '.join(missing))
    html = (SITE/'index.html').read_text(encoding='utf-8')
    css = (SITE/'styles.css').read_text(encoding='utf-8')
    app = (SITE/'app.js').read_text(encoding='utf-8')
    workflow = (ROOT/'.github/workflows/pages.yml').read_text(encoding='utf-8')
    data = json.loads(DATA.read_text(encoding='utf-8'))
    features = parse_features()

    # Page sections and workflow
    for feature_file, section in REQUIRED_SECTIONS.items():
        if f'id="{section}"' not in html:
            return fail(f'section #{section} missing for {feature_file}')
        if f'data-feature="{feature_file}"' not in html:
            return fail(f'data-feature marker missing for {feature_file}')
    for token in ['actions/deploy-pages', 'actions/upload-pages-artifact', 'scripts/validate_site.py', 'scripts/validate_features.py']:
        if token not in workflow:
            return fail(f'Pages workflow missing {token}')
    for token in ['@media (max-width: 1020px)', '@media (max-width: 700px)', '@media (max-width: 390px)']:
        if token not in css:
            return fail(f'responsive breakpoint missing: {token}')

    # Coverage must exactly name every feature and scenario.
    coverage = {item['file']: item for item in data.get('coverage', [])}
    if set(coverage) != set(features):
        return fail(f'coverage files mismatch: {sorted(set(features)-set(coverage))} missing, {sorted(set(coverage)-set(features))} extra')
    for feature_file, parsed in features.items():
        item = coverage[feature_file]
        if item.get('section') != REQUIRED_SECTIONS[feature_file]:
            return fail(f'{feature_file} mapped to wrong section')
        if item.get('feature') != parsed['feature']:
            return fail(f'{feature_file} feature title mismatch')
        if item.get('scenarios') != parsed['scenarios']:
            return fail(f'{feature_file} scenario coverage mismatch')
        for scenario in parsed['scenarios']:
            if scenario not in json.dumps(data, ensure_ascii=False):
                return fail(f'scenario title not present in site data: {scenario}')

    # Mock population and feature semantics.
    listings = data.get('listings', [])
    if len(listings) < 12:
        return fail('expected at least 12 mock listings')
    for card in listings:
        missing_fields = [field for field in REQUIRED_CARD_FIELDS if field not in card or card[field] in ('', [], None)]
        if missing_fields:
            return fail(f'{card.get("id", "<unknown>")} missing fields: {missing_fields}')
        if len(card['evidence']) < 3 or len(card['alternatives']) < 3 or len(card['authority']) < 3:
            return fail(f'{card["id"]} needs at least 3 evidence, alternatives, and authority items')
    roles = {role['id'] for role in data.get('rolePaths', [])}
    required_roles = {'get-direct-agent','bring-agent','feed-support','find-agency','join-venture','train-certify','build-crew','publish-demand'}
    if roles != required_roles:
        return fail('role path set mismatch')
    if not any(card['ownership'] == 'third-party' for card in listings):
        return fail('no third-party listing')
    if not any(card['sponsorship'] in {'sponsored','referral-paid'} for card in listings):
        return fail('no sponsored/referral-paid listing')
    if not any(card.get('sharedSubstrate') for card in listings):
        return fail('no shared substrate disclosure')
    if not any(card.get('burnReceipt') for card in listings):
        return fail('no listing with burn receipt')

    burn = data.get('burnReceipts', [])
    if not burn:
        return fail('missing burn receipts')
    for receipt in burn:
        for key in ['lifetime','last_30_days','last_7_days']:
            if key not in receipt.get('windows', {}):
                return fail(f'burn receipt missing window {key}')
        if len(receipt.get('modelBreakdown', [])) < 3 or len(receipt.get('antiInflation', [])) < 4:
            return fail('burn receipt missing model or anti-inflation evidence')
    if len(data.get('cleanRoomModes', [])) < 6:
        return fail('expected six clean-room modes')
    if len(data.get('receipts', [])) < 5:
        return fail('expected receipt ledger examples')
    if not any(item.get('visibility') == 'confidential aggregate' for item in data.get('demandItems', [])):
        return fail('missing confidential aggregate demand item')
    if len(data.get('apiRoutes', [])) < 9:
        return fail('expected agent API routes')

    # Make sure visible page/app mentions the core doctrines.
    combined = html + css + app + json.dumps(data, ensure_ascii=False)
    for phrase in ['Bring your agent', 'Show the burn', 'clean-room', 'agent-spend audit', 'alternatives', 'Conscience', 'provenance', 'cancellation', 'renewal', 'demand']:
        if phrase.lower() not in combined.lower():
            return fail(f'missing required phrase: {phrase}')

    print(f'Validated Storefront site: {len(features)} feature files, {sum(len(v["scenarios"]) for v in features.values())} scenarios, {len(listings)} mock listings, {len(data.get("apiRoutes", []))} API routes.')
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
