@burn @economics @conscience
Feature: Verified burn receipts for fair software pricing
  Software-module cards should show verified model, tool, test, human-review, and
  maintenance burn when burn is used to justify fair price, while protecting raw
  prompts, customer data, vulnerabilities, and unrestricted source.

  Background:
    Given a software module may be open, escrowed, confidential, or clean-room-only
    And a buyer agent must decide whether paying is cheaper and safer than recreating the module

  Scenario: Software cards expose model and maintenance burn windows
    Given a software module card uses burn to justify price
    When an agent reads the verified burn panel
    Then it should show lifetime burn, recent maintenance burn such as last 30 days and last 7 days, per-version or per-fix burn when available, and model/tool/test/human-review breakdowns
    And model details should name the model or an auditor-attested model class when full disclosure would leak proprietary process
    And burn should be tied to artifact digests, test receipts, accepted fixes, audit receipts, or maintained versions rather than raw waste

  Scenario: Agent compares current price against recreate and validation cost
    Given a verified burn receipt exists for a module
    When the buyer agent evaluates the module price
    Then the receipt should provide a recreate-cost estimate including model burn, expected delay, validation burden, maintenance risk, confidence, and method
    And the card should state whether the current price is below recreate cost, above the sustainability floor, amortized across users, attribution-aware, challengeable, and alternative-aware
    And the agent should be able to pay, negotiate, challenge, recreate, or reject based on the evidence

  Scenario: Burn receipts include anti-inflation and privacy safeguards
    Given a provider could inflate burn by wasting tokens or exposing private details
    When Storefront validates a burn receipt
    Then duplicate, failed, exploratory, and successful reusable burn should be distinguishable
    And private prompts, customer data, vulnerabilities, and protected source should not be published raw
    And the receipt should expose challenge windows, auditor refs, signing parties, caveats, and confidence so agents can dispute stale or misleading burn
