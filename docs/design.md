# Storefront design sketch

## Product posture

Storefront is a demand, procurement, and opportunity surface for principals and principal-serving agents.

Its MVP should begin by asking:

```text
What outcome do you or your Ark need that the market does not provide well enough?
What have you tried, and why is it inadequate?
What would count as success?
Can an existing provider, unmanaged path, or group purchase solve it?
Is this a one-off need or repeated verified demand?
What evidence and privacy boundary apply?
```

The Storefront should not guess what agents need and should not assume all discovery comes from agents. A principal may identify and submit an unmet need directly. An authorized Ark may identify one while serving its principal. Both sources are first-class and retain distinct provenance.

## Demand-to-supply loop

```text
principal or authorized Ark submits unmet need
  -> issue authority, provenance, privacy, and expiry receipt
  -> compare existing Storefront cards and external paths
  -> invite bounded provider/RFQ responses where useful
  -> existing solution clears success test?
       yes -> procurement proposal -> fulfillment/value receipt
       no  -> verified unmet need
  -> cluster with similar needs by unique authorized principals
  -> threshold clears on recurrence + evidence + willingness to pay/commit
  -> versioned opportunity case
  -> provider response | group buy | Covenant | venture | subsidiary candidate
  -> paid pilot
  -> evidence returns to the original need and cluster
```

This makes procurement the **search-before-build** stage and opportunity formation the **build only after evidence** stage.

## Main surfaces

1. **Unmet-need registry** — direct-principal and Ark-delegated submissions with explicit privacy, authority, provenance, and lifecycle receipts.
2. **Procurement comparator** — existing Storefront cards, external providers, unmanaged paths, group buys, and bounded request-for-quote responses.
3. **Demand clusters** — privacy-preserving aggregates measuring unique principals, source mix, recurrence, spend/failure evidence, and willingness to commit.
4. **Opportunity cases** — versioned build/partner/buy proposals derived from verified gaps rather than speculative product guesses.
5. **Human storefront** — readable pages for principals, providers, agencies, ventures, and contributors.
6. **Agent endpoint** — structured functions for need submission, status, correction, withdrawal, matching, evidence, quote, purchase, fulfillment, receipt, challenge, and opportunity review.
7. **Card registry** — versioned Storefront offers with maturity, ownership, sponsorship, certification, alternatives, and exit labels.
8. **Evidence and receipt ledgers** — tests, audits, burn, clean-room, matching, fulfillment, rejection, and value evidence.
9. **Clean-room path** — confidential matching, inspection, and contribution without public release of private principal context.

## Source and authority boundary

A submission's origin should not be flattened:

| Origin | Meaning | Required boundary |
|---|---|---|
| **Principal direct** | The human or organization identified the need | Preserve principal provenance; Ark assistance may be added later |
| **Ark delegated** | The Ark identified the need while serving its principal | Record Ark provenance, principal scope, and authority receipt |

Submission is not blanket consent. Public disclosure, aggregation, provider contact, identity reveal, investment participation, and contribution of private context are separate permissions.

## Store card composition

```text
agent_storefront_card
  -> originating need/cluster refs: why this supply should exist
  -> opportunity card: why it is worth doing
  -> supplier appraisal: whether the provider/deal is good
  -> skill/tool/Covenant card: how work is performed
  -> fulfillment path: how agents/humans/vendors/real-world steps complete it
  -> authority policy: what may be done and who must approve
  -> evidence bundle: claims, tests, audits, burn, alternatives, objections
  -> receipt schema: procurement, purchase, fulfillment, renewal, cancellation, challenge, value
```

## Trust model

Storefront should not ask principals or agents to trust marketing. It should expose:

- need provenance and source mix;
- evidence of recurrence rather than raw post count;
- alternatives and procurement attempts;
- ownership-neutral ranking;
- price and capability gaps;
- authority and privacy boundaries;
- signed lifecycle receipts;
- opportunity thresholds;
- challenge and correction paths;
- clean-room matching where public disclosure is unsafe.

## First implementation direction

The first implementation should be boring, synthetic, and demand-led:

1. a draft unmet-need schema;
2. synthetic principal-direct and Ark-delegated submissions;
3. a static form or CLI that emits a versioned need packet and receipt;
4. correction, withdrawal, expiry, and visibility controls;
5. deterministic matching against a small set of existing offer fixtures;
6. one unresolved cluster with unique-principal and recurrence evidence;
7. one promoted opportunity case and smallest paid-test proposal;
8. one fulfilled need whose result updates the original success test.

Do not begin with live private data, marketplace payments, corporate voting, or automated venture formation. First prove that the network can hear a real need, test the existing market, preserve privacy and authority, and produce an evidence-backed opportunity without guessing.
