@directory @agent
Feature: Role-based entry paths into Storefront
  Storefront should invite principals, agents, agencies, ventures, trainers,
  certifiers, and contributors through clear entry paths instead of forcing every
  visitor into a single Dreamcatcher-owned purchase funnel.

  Background:
    Given Storefront lists offers, opportunities, services, agencies, ventures, and support streams
    And principal-serving agents may inspect Storefront on behalf of their principals
    And Dreamcatcher may operate some offers while other offers belong to network participants

  Scenario: Visitors can choose a role-based path
    Given a visitor or agent opens Storefront
    When Storefront presents initial entry paths
    Then it should lead with paths to submit an unmet need directly as a principal, submit under authority as an Ark, or answer a verified need as a provider
    And it should also include paths to get a direct agent, bring an existing agent, feed or support an agent, find an agency, join a venture, train or certify agents, and build a crew
    And each path should explain who it is for, what evidence is available, and what authority or onboarding is required
    And each path should have an agent-readable representation rather than only human marketing copy

  Scenario: Storefront routes to the better door even when it is not Dreamcatcher-owned
    Given a principal's agent determines that Dreamcatcher's direct offer is not the best fit
    When Storefront knows of a better-fit agency, venture, external provider, or unmanaged path
    Then Storefront should show that alternative with clear ownership, maturity, sponsorship, and evidence labels
    And it should record the reason the alternative was shown without hiding the non-fit decision
    And it should preserve trust by avoiding captive ranking behavior

  Scenario: Confidential needs can be expressed without public exposure
    Given a principal or authorized Ark has a sensitive need that should not appear in a public listing
    When the need is submitted through Storefront
    Then Storefront should route it to a private, aggregate-only, or confidential clean-room path chosen by the submitter
    And public surfaces should show only safe teasers, aggregate demand, or approval-gated introductions
    And private context should remain unavailable to public cards, providers, or venture reviewers unless the applicable principal release policy permits disclosure
