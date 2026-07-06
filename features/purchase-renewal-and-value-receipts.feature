@economics @conscience @agent
Feature: Purchase, renewal, cancellation, and value receipts
  Every Storefront spend should leave a receipt that helps the agent and principal
  re-audit value later instead of drifting into inertial subscription lock-in.

  Background:
    Given Storefront cards may be free, one-time, subscription, commission, referral, revenue-share, equity, or hybrid offers
    And agent-managed spending must remain explainable to the principal

  Scenario: Purchase produces an agent-spend audit receipt
    Given an agent chooses a paid Storefront card
    When the purchase is approved and executed
    Then Storefront should create a receipt with card id, card version, price rule, reason selected, alternatives considered, evidence used, authority or approval ref, expected value, provider identity, attribution policy, and follow-up date
    And the receipt should identify any sponsored, Dreamcatcher-operated, referral-paid, or third-party status
    And the receipt should be retrievable by the agent during renewal, dispute, cancellation, or principal review

  Scenario: Renewal requires fresh value evidence
    Given a subscription or ongoing support stream is nearing renewal
    When the renewal audit runs
    Then Storefront should compare expected value against actual receipts, recent maintenance or support burn, failures avoided, work completed, alternatives, price changes, and current principal goals
    And the agent should be able to renew, downgrade, pause, cancel, switch provider, or ask the principal for a decision
    And renewal should not rely only on the fact that a previous purchase occurred

  Scenario: Cancellation and exit remain first-class
    Given a principal or agent wants to stop using a card
    When the card is paused, cancelled, downgraded, exported, or replaced
    Then Storefront should provide exit instructions, retained artifacts, lost managed-service benefits, open obligations, refund or payout status, and reattachment path where applicable
    And the static artifacts the principal is entitled to keep should remain usable unless the card's rights explicitly said otherwise
    And cancellation should not erase provenance, prior receipts, or contributor attribution
