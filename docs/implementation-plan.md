# Storefront implementation plan

## Product decision

The first Storefront MVP is the **principal-and-Ark unmet-need registry**, not a large catalogue of offers.

The opening question is:

> What outcome do you or your Ark need that the market does not currently provide well enough?

Storefront should first test whether an existing provider, Storefront card, unmanaged path, or group purchase can satisfy the need. Only a repeated, evidenced gap should become a new opportunity case. That gives Dreamcatcher a demand-led path from real principal needs to providers, Covenants, ventures, and eventually operating subsidiaries without guessing what agents or principals want.

## Phase 0 — Spec seed

- [x] Create feature-first repo.
- [x] Write behavior features from the July Storefront discussion.
- [x] Add draft card, burn receipt, and purchase receipt schemas.
- [x] Add a feature validator.
- [x] Promote principal-and-Ark unmet-need submission to the MVP contract.
- [x] Add the draft `unmet_need_submission` schema.

## Phase 1 — Unmet-need registry MVP

- [ ] Add a human form and agent-readable endpoint for direct-principal and Ark-delegated submissions.
- [ ] Require desired outcome, observable success test, current workaround, why alternatives fail, recurrence, constraints, and privacy policy.
- [ ] Issue signed submission, correction, withdrawal, expiry, and release receipts.
- [ ] Support public, pseudonymous, aggregate-only, private, and confidential-clean-room visibility.
- [ ] Preserve principal-originated and Ark-originated discovery as distinct first-class provenance.
- [ ] Allow a principal to invite an Ark to refine or manage a directly submitted need without erasing origin.
- [ ] Publish only fixtures and synthetic needs until private-data handling and authority checks are proven.

## Phase 2 — Search-before-build procurement loop

- [ ] Compare each sufficiently specified need with Storefront cards, external providers, unmanaged paths, and group-buy options.
- [ ] Add bounded request-for-quote/provider-response fixtures.
- [ ] Record alternatives tried, price/capability gaps, and why no existing path passed the success test.
- [ ] Resolve suitable needs through an auditable procurement proposal rather than creating unnecessary ventures.
- [ ] Demonstrate ownership-neutral ranking: Dreamcatcher-operated supply receives no default advantage.

## Phase 3 — Demand clustering and opportunity formation

- [ ] Cluster materially similar needs using safe fields and private matching where necessary.
- [ ] Count unique authorized principals, source mix, recurrence, spend/failure evidence, willingness-to-pay or commit, and expiry.
- [ ] Prevent multiple Arks or posts controlled by one principal from inflating independent demand.
- [ ] Define a predeclared opportunity threshold.
- [ ] Promote a verified cluster into a versioned opportunity case with build/partner/buy alternatives and the smallest paid test.
- [ ] Preserve consented principal/Ark provenance without implying equity, rewards, service preference, or public disclosure.

## Phase 4 — Static card registry

- [ ] Create `cards/` with sample cards for enterprise Staff Arks, managed support, per-job solution packets, agencies, ventures, trainers/certifiers, and an Ark-native professional-service lane.
- [ ] Add a card validator for required fields.
- [ ] Add sample evidence refs, alternatives, objections, and receipt refs.
- [ ] Add a simple static renderer or Markdown generator.
- [ ] Link any new offer back to the unmet-need cluster and paid test that justified it.

## Phase 5 — Buyer-agent audit and receipt harness

- [ ] Add a deterministic fixture-based audit command that reads a card and outputs pay, negotiate, inspect, procure elsewhere, monitor, or reject.
- [ ] Include authority, evidence, alternatives, burn, and exit checks.
- [ ] Add mock Conscience policy fixtures.
- [ ] Add sample quote, purchase, fulfillment, renewal, cancellation, challenge, and value receipts.
- [ ] Close the loop by recording whether the original need's success test actually passed.

## Phase 6 — Service/API prototype

- [ ] Serve unmet-need and card JSON/YAML together with human pages.
- [ ] Add read-only endpoints for safe need clusters, cards, evidence, alternatives, and receipts.
- [ ] Add authority-gated endpoints for submission, correction, withdrawal, provider response, and venture review.
- [ ] Project the same contracts through WebMCP without creating a second source of truth.
- [ ] Keep real payment/provider integrations out of scope until the contracts and privacy boundaries are proven.

## Phase 7 — Dreamcatcher substrate integration

- [ ] Connect submissions to Conscience authority and release-policy checks.
- [ ] Connect confidential demand to attested clean-room matching.
- [ ] Connect offers to Covenant/solution packets and verified burn ledgers.
- [ ] Connect opportunity cases to provenance/attribution graphs and an authorized venture-decision process.
- [ ] Keep Storefront demand discovery separate from stock ownership, corporate voting, and investment recommendation.
