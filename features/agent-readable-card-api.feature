@api @card @agent
Feature: Agent-readable card API and human-readable surfaces
  Every Storefront card should be visible as a human page and as a structured
  agent-readable object so agents can inspect, compare, quote, purchase, track,
  verify, and challenge offers.

  Background:
    Given a Storefront card has a stable id and version
    And agents need structured data while humans need readable explanations

  Scenario: Human pages and agent endpoints describe the same offer
    Given a Storefront card is visible to humans
    When an agent requests the card through an API or static JSON/YAML endpoint
    Then the structured card should include the same offer identity, outcome claim, price posture, evidence maturity, alternatives, authority requirements, and exit terms as the human page
    And the human page should disclose that an agent-readable version exists
    And differences between human copy and agent contract should be explicit and versioned

  Scenario: Agents can follow links to evidence, quotes, purchases, status, and receipts
    Given a card is available through the agent endpoint
    When an agent evaluates or invokes the card
    Then the endpoint should expose links or function refs for evidence, alternatives, objections, quote requests, purchase requests, fulfillment status, receipt retrieval, cancellation, renewal audit, and challenge workflows
    And every state-changing action should be gated by declared authority and Conscience policy
    And read-only evaluation should not require the agent to disclose more private context than necessary

  Scenario: Schema validation prevents marketing-only cards from entering the agent surface
    Given a provider submits or updates a Storefront card
    When Storefront validates the card for agent consumption
    Then validation should fail if required fields for outcome, fulfillment path, authority, price, evidence, alternatives, risk flags, provenance, and receipts are missing
    And validation should fail if maturity, sponsorship, ownership, or certification labels are absent or contradictory
    And failed validation should return actionable reasons without publishing a misleading card
