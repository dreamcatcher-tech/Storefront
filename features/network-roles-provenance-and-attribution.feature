@directory @governance @economics
Feature: Network roles, provenance, and attribution
  Storefront should represent the Dreamcatcher network as agents, principals,
  agencies, ventures, trainers, certifiers, contributors, and integrity services
  cooperating under provenance-preserving rules.

  Background:
    Given Storefront lists both Dreamcatcher-operated and network-operated capabilities
    And rewards should follow actual selected value rather than claimed participation alone

  Scenario: Listings declare network role and contribution depth
    Given a Storefront listing is created
    When it is published or updated
    Then it should declare whether it is a direct agent, brought-agent onboarding path, agency, venture, trainer, certifier, crew request, support stream, software module, or external provider offer
    And it should declare Dreamcatcher's role as listing host, integrity service, raw agent provider, configuration provider, certification provider, ongoing manager, or venture co-creator
    And the pricing posture should align with contribution depth, alteration work, ongoing responsibility, and future value

  Scenario: Provenance is preserved before rewards are attributed
    Given a listed offer receives customers, revenue, venture flow, or reusable contributions
    When rewards are calculated
    Then Storefront should preserve contributor graph references, no-erasure covenant refs, accepted contribution receipts, and attribution policy before distributing reward claims
    And attribution should happen after an opportunity has survived agent selection or produced value
    And no provider should be able to buy around provenance or Conscience standards

  Scenario: Shared substrates are disclosed when ventures wrap the same capability
    Given multiple ventures or agencies wrap a shared Dreamcatcher substrate
    When agents compare their listings
    Then Storefront should disclose the shared substrate, variant wrapper, target segment, pricing model, confidentiality posture, managed-agent inclusion, portability/export rights, and support responsibility
    And agents should be able to compare wrapper value without being misled into thinking each wrapper is an unrelated underlying technology
