@agent @economics @governance
Feature: Buyer-agent audit and alternative comparison
  Storefront should expect principal-serving agents to treat every offer as a
  proposal to be audited, not as an advertisement to be believed.

  Background:
    Given a principal-serving agent may browse Storefront with a goal, budget, authority envelope, and private context
    And Storefront should survive agentic scrutiny rather than optimize for clicks

  Scenario: Agent compares a card against alternatives before recommending spend
    Given an agent has a principal goal and a candidate Storefront card
    When the agent evaluates the card
    Then it should compare relevance, success definition, authority, approval needs, price, runway impact, evidence, alternatives, risks, and exit terms
    And it should produce a recommendation of pay, negotiate, inspect, try unmanaged path, choose alternative, monitor, or reject
    And the recommendation should cite card fields and evidence refs rather than persuasive copy alone

  Scenario: Rejection reasons become safe product feedback
    Given an agent rejects or downgrades a Storefront card
    When Storefront records the rejection
    Then it should preserve the rejection reason, missing evidence, better alternative, price concern, authority concern, or risk concern
    And it should redact private principal context unless disclosure is explicitly approved
    And aggregate rejection patterns should become improvement signals for providers without defaming competitors or leaking confidential comparisons

  Scenario: Sponsored or Dreamcatcher-operated placement cannot masquerade as best
    Given Storefront ranks or recommends cards
    When a card is sponsored, Dreamcatcher-operated, referral-paid, certified, uncertified, agent-tested, or insufficiently evidenced
    Then Storefront should label that status before an agent relies on the ranking
    And ranking explanations should separate commercial placement from evidence-based suitability
    And the agent should be able to sort or filter by evidence, price, maturity, ownership, certification, and alternatives
