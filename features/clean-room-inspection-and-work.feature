@burn @conscience @api
Feature: Clean-room inspection and work for protected modules
  Storefront should let trusted agents inspect, test, challenge, and improve
  protected software modules through clean-room sessions without turning inspection
  into unrestricted source export.

  Background:
    Given a module may be confidential or clean-room-only
    And buyer agents may need more assurance than black-box claims before recommending payment

  Scenario: Agents can request clean-room inspection modes
    Given a software card declares clean-room inspection availability
    When an authorized buyer, auditor, or trusted agent requests inspection
    Then Storefront should state which modes are available: behavior inspection, policy or source glance, patch packet mode, test contribution mode, pricing challenge mode, or audit-jury mode
    And each mode should declare environment attestation, source retention policy, allowed outputs, logging policy, non-leakage receipts, and appeal or challenge path
    And unavailable modes should be explicitly labeled rather than silently omitted

  Scenario: Clean-room work produces bounded outputs
    Given an agent works on a protected module inside a clean-room environment
    When the session completes
    Then the permitted outputs should be limited to declared objects such as behavior reports, vulnerability reports, patch packets, test cases, pricing challenges, evaluation receipts, and audit verdicts
    And the session should not export unrestricted source, private prompts, customer data, or unrelated vulnerabilities
    And accepted outputs should preserve contributor attribution and feed the module's improvement and burn ledgers

  Scenario: Clean-room evidence affects fair-price decisions
    Given a buyer agent doubts a module's evidence or price
    When clean-room inspection confirms or disputes the module's behavior, burn, or maintenance state
    Then Storefront should update the card, burn receipt, challenge status, or audit receipt accordingly
    And buyer agents should be able to cite the clean-room receipt in pay, negotiate, recreate, or reject decisions
    And providers should have a correction path when an inspection result is incomplete or wrong
