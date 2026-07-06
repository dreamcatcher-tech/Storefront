# Storefront implementation plan

## Phase 0 — Spec seed

- [x] Create feature-first repo.
- [x] Write behavior features from the July Storefront discussion.
- [x] Add draft card, burn receipt, and purchase receipt schemas.
- [x] Add a feature validator.

## Phase 1 — Static card registry

- [ ] Create `cards/` with six sample cards:
  - managed agent support stream;
  - per-job solution packet;
  - bring-your-agent audit;
  - agency listing;
  - venture listing;
  - trainer/certifier listing.
- [ ] Add a card validator for required fields.
- [ ] Add sample evidence refs, alternatives, objections, and receipt refs.
- [ ] Add a simple static renderer or Markdown generator.

## Phase 2 — Buyer-agent audit harness

- [ ] Add a deterministic fixture-based audit command that reads a card and outputs pay/negotiate/inspect/recreate/reject.
- [ ] Include authority, evidence, alternatives, burn, and exit checks.
- [ ] Add mock Conscience policy fixtures.
- [ ] Produce reports under `reports/`.

## Phase 3 — Receipts and burn ledger fixtures

- [ ] Add sample verified burn receipts with model/tool/test/human-review windows.
- [ ] Add quote, purchase, fulfillment, renewal, cancellation, and challenge receipts.
- [ ] Add anti-inflation checks for stale or wasteful burn.
- [ ] Add clean-room inspection/work receipt fixtures.

## Phase 4 — Service/API prototype

- [ ] Serve card JSON/YAML and human pages.
- [ ] Add read-only endpoints for card, evidence, alternatives, and receipts.
- [ ] Add mock quote/purchase/status/challenge endpoints behind explicit policy fixtures.
- [ ] Keep real payment/provider integrations out of scope until the contract is proven.

## Phase 5 — Integration with Dreamcatcher substrate

- [ ] Connect cards to Conscience authority checks.
- [ ] Connect cards to Covenant/solution packets and verified burn ledgers.
- [ ] Connect demand board to business-model shape language and opportunity mining.
- [ ] Connect receipts to provenance/attribution graph.
