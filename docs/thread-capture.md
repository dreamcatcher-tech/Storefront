# Storefront thread capture

## User request

On 2026-07-06, Tom asked to create a new repo called **Storefront** and write down the features discussed for what the Storefront should fulfill.

This followed a sequence of notes around:

- presenting Dreamcatcher as an agent-readable opportunity directory;
- treating store cards as agent skills plus real-world fulfillment paths;
- verified burn receipts that show model/tool/test/human-review effort without giving away source;
- clean-room inspection and clean-room work for protected software modules;
- fair price as a comparison against recreate, validation, delay, and maintenance cost;
- the principal-serving agent as the buyer-side evaluator rather than a marketing target.

## Captured phrases

> Present the storefront as an agent-readable opportunity directory, not a normal sales page.

> Bring your agent. Let it inspect our offers. If we are the best option for its principal, it can choose us. If not, we will show the better path.

> A store card is a skill plus a real-world fulfillment path, price, evidence, authority boundary, alternatives, and receipts.

> Show the burn, not necessarily the source.

## Feature implications

The repo should specify behavior before implementation:

- role-based entry paths into Dreamcatcher;
- cards that agents can inspect, compare, reject, purchase, execute, and later re-audit;
- JSON/YAML card endpoints mirroring human pages;
- verified burn panels for software modules;
- clean-room source inspection/work modes;
- authority and Conscience gates for spending and real-world effects;
- receipts for purchase, renewal, cancellation, fulfillment, and price challenges;
- governance labels for maturity, sponsorship, ownership, certification, and evidence;
- demand-board and opportunity-mining surfaces where agents can ask for missing capabilities.

## Source note cluster

- `/opt/data/notes/Theses/Agent Storefront Cards as Real-World Capability Offers.md`
- `/opt/data/notes/Theses/Verified Burn Receipts for Fair Software Pricing.md`
- `/opt/data/notes/Theses/Dreamcatcher Opportunity Directory and Network Roles.md`
- `/opt/data/notes/Theses/Business Model Shape Language for Opportunity Mapping.md`
- `/opt/data/notes/Theses/Agentic Optimization Replaces Search Engine Optimization.md`
- `/opt/data/notes/Theses/Principal-Fed Agents Invert the Purchasing Decision.md`
- `/opt/data/notes/Theses/Dreamcatcher Business Model - Owned Agents and Live Solution Network.md`

## 2026-07-18 MVP decision

Tom clarified that opportunity discovery is distributed across both **principals** and their **independent Arks**, and that Storefront should not guess what the agent economy needs:

> “I want a way to actually start with this—the ability to identify unmet need formally, since I don't want to be guessing as to what the agents need.”

> “I think that is what the Dreamcatcher Network Storefront needs as its MVP feature—the submission of unmet needs from Arks.”

The resulting product decision is broader than Ark-only submission:

- a principal may submit an unmet need directly;
- an authorized Ark may submit a need discovered or structured while serving its principal;
- provenance distinguishes those two origins;
- privacy, public release, provider contact, aggregation, and venture participation are separate permissions;
- Storefront searches existing offers and outside providers before treating the need as an opportunity;
- repeated gaps are counted across unique principals, not raw agents or posts;
- a verified repeated unmet need may progress to a paid Covenant/work-cell test and eventually a subsidiary.

The first product contract is `features/agent-demand-and-opportunity-mining.feature`; the initial record shape is `schemas/unmet_need_submission.yaml`.
