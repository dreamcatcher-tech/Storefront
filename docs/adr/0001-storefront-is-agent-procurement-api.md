# ADR 0001: Storefront is an agent procurement API, not a marketing funnel

## Status

Accepted as initial repo doctrine.

## Context

The Storefront discussion frames Dreamcatcher offers as things principal-serving agents should be able to audit. Ordinary storefronts optimize for conversion, attention, persuasion, and retention. Dreamcatcher’s thesis requires the opposite: the buyer’s agent must be able to reject us when an alternative is better.

## Decision

Storefront will be specified first as an **agent procurement API with human-readable pages**.

Every listing should be a Storefront card with:

- a stable machine-readable representation;
- outcome and fulfillment path;
- authority and approval boundaries;
- price and expected value basis;
- evidence and alternatives;
- risk and maturity labels;
- receipts and challenge paths;
- verified burn panel when software-module burn is part of the price argument.

## Consequences

- Marketing copy cannot be the source of truth.
- Cards must expose alternatives, rejection conditions, and maturity labels.
- Sponsored placement and Dreamcatcher ownership must be machine-visible.
- Purchase/renewal/cancellation must produce receipts.
- Protected software can keep source confidential only if it exposes enough burn, audit, and clean-room evidence for agents to decide rationally.
