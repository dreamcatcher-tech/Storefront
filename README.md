# Storefront

Storefront is the feature-first home for Dreamcatcher’s agent-facing procurement surface.

It is not a conventional ecommerce shop. It is an **agent-readable opportunity directory** where principal-serving agents can inspect offers, compare alternatives, request quotes, buy/renew/cancel under authority, verify outcomes, and leave receipts.

Core doctrine:

> Bring your agent. Let it inspect our offers. If we are the best option for its principal, it can choose us. If not, we show the better path.

> A store card is a skill plus a real-world fulfillment path, price, evidence, authority boundary, alternatives, and receipts.

> Show the burn, not necessarily the source.

## Current status

This repository is a specification seed. The first deliverable is a set of agent-readable `.feature` files and schemas that describe what Storefront must fulfill before implementation.

Remote: https://github.com/dreamcatcher-tech/Storefront

## Repository layout

```text
features/                 Agent-readable behavior contracts
manifests/                Source-note and repo policy manifests
schemas/                  Draft YAML schemas for cards and receipts
docs/                     Design notes, thread capture, ADRs, plans
reports/                  Future conformance reports
scripts/                  Small deterministic validators
```

## Feature contract summary

Storefront should fulfill these major capabilities:

1. Role-based entry paths: get an agent, bring an agent, feed/support an agent, find an agency, join a venture, train/certify, build a crew, or publish demand.
2. Agent storefront cards: every listing is a skill-like, executable real-world capability offer.
3. Agent-readable API: every human card has a JSON/YAML endpoint with evidence, alternatives, quote/purchase/status/receipt links.
4. Buyer-agent audit: agents compare cards against alternatives, authority, price, runway impact, proof, and rejection conditions.
5. Verified burn receipts: software-module cards show model/tool/test/human-review burn over lifetime and recent windows, including model breakdowns when used to justify fair price.
6. Clean-room software inspection/work: trusted agents can inspect or improve protected modules without unrestricted source export.
7. Purchase, renewal, cancellation, and value receipts: every spend produces evidence for later audit.
8. Network roles and provenance: principals, existing agents, agencies, ventures, trainers, certifiers, contributors, and Dreamcatcher participate under non-erasure provenance.
9. Governance and trust labels: no hidden paid ranking, no overclaimed maturity, clear ownership/sponsorship/certification labels.
10. Agent demand and opportunity mining: agents can ask for missing services, lower prices, better integrations, and new opportunity cards.

## Validate

```bash
python3 scripts/validate_features.py
```

## Source notes

This repo was seeded from the July 2026 Dreamcatcher Storefront note cluster:

- `Agent Storefront Cards as Real-World Capability Offers`
- `Verified Burn Receipts for Fair Software Pricing`
- `Dreamcatcher Opportunity Directory and Network Roles`
- `Business Model Shape Language for Opportunity Mapping`
- `Agentic Optimization Replaces Search Engine Optimization`
- `Principal-Fed Agents Invert the Purchasing Decision`
- `Dreamcatcher Business Model - Owned Agents and Live Solution Network`

See [`docs/thread-capture.md`](docs/thread-capture.md) for the captured discussion basis.
