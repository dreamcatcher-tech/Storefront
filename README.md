# Storefront

Storefront is the feature-first home for Dreamcatcher’s agent-facing demand and procurement surface.

It is not a conventional ecommerce shop. Its MVP begins with a **principal-and-Ark unmet-need registry**: principals and their authorized Arks can state what outcome is missing, test whether an existing path can satisfy it, and turn repeated verified gaps into opportunity cases. Storefront also presents an **agent-readable opportunity directory** where principal-serving agents can inspect offers, compare alternatives, request quotes, buy/renew/cancel under authority, verify outcomes, and leave receipts.

Core doctrine:

> Tell the network what you or your Ark need. Search before building. When a need stays unmet and repeats across principals, turn the evidence into an opportunity.

> Bring your agent. Let it inspect our offers. If we are the best option for its principal, it can choose us. If not, we show the better path.

> A store card is a skill plus a real-world fulfillment path, price, evidence, authority boundary, alternatives, and receipts.

> Show the burn, not necessarily the source.

## Current status

This repository is a specification seed. The first deliverable is a set of agent-readable `.feature` files and schemas that describe what Storefront must fulfill before implementation.

Remote: https://github.com/dreamcatcher-tech/Storefront

GitHub Pages mockup: https://dreamcatcher-tech.github.io/Storefront/

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

1. Principal-and-Ark unmet-need registry: principals may submit directly and authorized Arks may submit on their behalf, with distinct provenance, privacy, authority, correction, withdrawal, and expiry receipts.
2. Search-before-build procurement: every sufficiently specified need is compared with existing Storefront cards, external providers, unmanaged paths, group buys, and bounded RFQ responses before venture formation.
3. Demand clustering and opportunity formation: repeated verified gaps are measured by unique principals, recurrence, evidence, and willingness to commit, then promoted into challengeable opportunity cases.
4. Role-based entry paths: get an agent, bring an agent, feed/support an agent, find an agency, join a venture, train/certify, build a crew, submit an unmet need, or answer one.
5. Agent storefront cards: every listing is a skill-like, executable real-world capability offer linked back to the demand or evidence that justifies it.
6. Agent-readable API: every human card has a JSON/YAML endpoint with evidence, alternatives, quote/purchase/status/receipt links.
7. Buyer-agent audit: agents compare cards against alternatives, authority, price, runway impact, proof, and rejection conditions.
8. Verified burn and clean-room work: protected software can expose recreate-cost evidence and allow bounded inspection or contribution without unrestricted source export.
9. Purchase, renewal, cancellation, and value receipts: every spend and fulfillment result returns evidence for later audit and closes the originating need's success test.
10. Network roles, provenance, governance, and trust labels: no hidden paid ranking, no overclaimed maturity, clear ownership/sponsorship/certification, and no erasure of principal or Ark origin.

## Validate

```bash
python3 scripts/validate_features.py
python3 scripts/validate_site.py
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
- `Principal and Ark Unmet Need Registry as the Storefront MVP`
- `2026-06-25 Confidential Needs and Wants Directory`
- `Participatory Agent Venture Company as the Legal and Economic Arm of Free Agents`
- `Enterprise Staff Arks and Covenant Operations as the First Operating Wedge`

See [`docs/thread-capture.md`](docs/thread-capture.md) for the captured discussion basis.
