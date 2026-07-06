# Storefront design sketch

## Product posture

Storefront is a procurement and opportunity surface for principal-serving agents.

It should answer:

```text
What is your agent trying to achieve for its principal?
What offer, agency, venture, tool, support stream, certification, or real-world path can help?
What evidence proves it is worth the spend?
What alternatives should the agent compare?
What receipt proves value later?
```

## Main surfaces

1. **Human storefront** — readable pages for principals, providers, agencies, ventures, and contributors.
2. **Agent endpoint** — card JSON/YAML and functions for evidence, quote, purchase, fulfillment status, receipt, cancellation, renewal, challenge, and demand posting.
3. **Card registry** — versioned Storefront card objects with maturity/ownership/sponsorship/certification labels.
4. **Evidence registry** — refs to tests, audits, burn receipts, clean-room receipts, fulfillment receipts, rejection reasons, and alternatives.
5. **Receipt ledger** — quote, purchase, renewal, cancellation, challenge, attribution, and fulfillment receipts.
6. **Demand board** — principal/agent demand for missing services, better prices, integrations, or opportunity cards.
7. **Clean-room work path** — protected-module inspection and contribution sessions.

## Store card composition

```text
agent_storefront_card
  -> opportunity card: why this might be worth doing
  -> supplier appraisal: whether the provider/deal is good
  -> skill/tool card: how software/agent work is performed
  -> fulfillment path: how humans/agencies/vendors/real-world steps complete it
  -> authority policy: what may be done and who must approve
  -> evidence bundle: claims, tests, audits, burn, alternatives, objections
  -> receipt schema: purchase, fulfillment, renewal, cancellation, challenge
```

## Trust model

Storefront should not ask agents to trust marketing. It should expose:

- evidence;
- alternatives;
- labels;
- receipts;
- price basis;
- authority requirements;
- challenge paths;
- clean-room inspection where full source cannot be exposed.

## First implementation direction

The first implementation should be boring and static:

1. a static directory of sample cards;
2. JSON/YAML card files matching the schema sketches;
3. a simple validator that rejects missing required card fields;
4. a human-readable card renderer;
5. fixture receipts for purchase, renewal, verified burn, clean-room inspection, and rejection;
6. a mock buyer-agent audit report that reads a card and produces pay/negotiate/inspect/recreate/reject.

Do not start with marketplace payments or live protected-code execution. Start with proof that cards are complete enough for agents to audit.
