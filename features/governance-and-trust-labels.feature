@governance @conscience @agent
Feature: Governance and trust labels
  Storefront should make trust state visible to agents and humans so the directory
  cannot degrade into SEO, pay-to-rank listings, or disguised proprietary lock-in.

  Background:
    Given Storefront may list offers at different maturity and trust levels
    And agents need explicit labels to avoid hidden bias

  Scenario: Every listing has visible maturity and ownership labels
    Given a card is listed in Storefront
    When a human or agent views it
    Then the card should label maturity as idea, pilot, measured, proven-for-segment, deprecated, or insufficient evidence
    And it should label ownership as Dreamcatcher-operated, third-party, partner, community, sponsored, referral-paid, certified, uncertified, agent-tested, or auditor-sealed where applicable
    And labels should be machine-readable, human-visible, versioned, and challengeable

  Scenario: Risk and externality flags are explicit
    Given a card can affect money, privacy, safety, legal duties, public welfare, employees, suppliers, or the environment
    When the card is validated or recommended
    Then Storefront should expose legal, privacy, safety, reliability, support, externality, and compliance risk flags
    And the card should state when human/professional review, explicit principal approval, or stronger Conscience gates are required
    And Storefront should not claim a card is safe merely because an agent can read it

  Scenario: Public claims do not overstate marketplace maturity
    Given Storefront is early or a listing has limited evidence
    When the card or homepage describes it
    Then Storefront should avoid implying a mature open marketplace, perfect agent truth, guaranteed best price, or universal fulfillment unless evidence exists
    And insufficient evidence should be a visible status, not hidden in small print
    And providers should be able to improve claims by adding receipts, tests, burn evidence, clean-room audits, and successful fulfillment records
