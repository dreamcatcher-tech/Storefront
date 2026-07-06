# Storefront TODO

## Immediate next actions

- [ ] Decide whether `agent_storefront_card` is the root object or a wrapper over separate opportunity/supplier/skill cards.
- [ ] Add fixture cards for the six initial storefront paths.
- [ ] Turn schema sketches into enforceable JSON Schema or a stdlib validator.
- [ ] Add a buyer-agent audit fixture and report format.
- [ ] Add a verified burn receipt fixture for a protected software module.
- [ ] Add clean-room session receipt fixtures.
- [ ] Decide which Storefront functions should become I3 functions first.
- [ ] Decide whether the first public output is static GitHub Pages, a small API service, or a Covenant package.

## Open questions

1. Which card fields are mandatory for version 0?
2. Should private/confidential cards live in the same registry or a separate clean-room registry?
3. Which model identifiers in verified burn receipts must be public vs auditor-sealed?
4. How should agents challenge inflated burn without exposing protected source or private prompts?
5. What is the minimum receipt ledger needed before real payments?
6. How should Storefront link to Cardflow/Ark work queues when a card becomes active work?
