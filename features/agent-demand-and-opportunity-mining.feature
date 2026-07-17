@directory @agent @economics @governance
Feature: Principal-and-Ark unmet-need registry and opportunity formation
  Storefront's MVP should begin with demand rather than guesswork. Principals and
  their authorized Arks should be able to state what outcome is missing, test the
  market for an existing solution, and turn repeated verified gaps into opportunity
  cases that a provider, venture, or future subsidiary can answer.

  Background:
    Given principals and their Arks may independently notice missing services, overpriced providers, repeated tasks, recurring failures, and group-demand opportunities
    And an Ark may act only within the authority and disclosure policy granted by its principal
    And Storefront can use business-model shapes to turn demand into comparable opportunity objects

  Scenario: A principal can submit an unmet need directly
    Given a principal has identified an outcome that available offers do not satisfy
    When the principal submits an unmet-need item without using an Ark
    Then Storefront should preserve the principal as the originator and capture the desired outcome, current workaround, why alternatives fail, recurrence, urgency, jurisdiction, constraints, success test, and willingness-to-pay or commit
    And the principal should be able to invite an Ark to refine or manage the item later without erasing principal provenance
    And direct principal discovery should count as first-class market evidence rather than being relabeled as agent discovery

  Scenario: An Ark can submit an unmet need under principal authority
    Given a principal-serving Ark identifies a missing, overpriced, unsafe, or inadequate service while working for its principal
    When the Ark submits an unmet-need item
    Then Storefront should record both Ark provenance and principal scope together with the applicable authority receipt
    And the item should distinguish Ark-originated discovery from principal-originated discovery
    And the principal or an authorized Ark should be able to correct, withdraw, expire, or narrow the item

  Scenario: Sensitive demand is disclosed only under an explicit release policy
    Given an unmet need may expose legal, health, financial, commercial, location, budget, or relationship context
    When a principal or authorized Ark chooses a visibility policy
    Then Storefront should support public, pseudonymous, aggregate-only, private, and confidential-clean-room submission
    And public surfaces should reveal only approved summaries, counts, ranges, constraints, or introductions
    And submitting a need should not authorize public disclosure, provider contact, investment participation, or contribution of private context unless each permission is separately granted

  Scenario: Storefront searches and procures before recommending construction
    Given an unmet-need item has an observable success test and enough safe information for matching
    When Storefront evaluates whether the need is actually unmet
    Then it should compare Storefront cards, external providers, unmanaged paths, group buys, and request-for-quote responses without preferring Dreamcatcher-owned supply
    And it should record alternatives tried, provider responses, price and capability gaps, and the reason no credible existing path cleared the success test
    And a suitable existing path should resolve the need through a procurement proposal rather than being promoted as a new venture

  Scenario: Repeated unmet needs are clustered without inflating demand
    Given several submissions may describe materially similar outcomes
    When Storefront forms an aggregate demand cluster
    Then it should measure unique authorized principals, source mix, recurrence, spend or failure evidence, willingness-to-pay or commit, common constraints, and expiry
    And multiple Arks or submissions controlled by one principal should not masquerade as independent principal demand
    And public cluster evidence should preserve confidential membership and resist vendor, promoter, and sybil manipulation

  Scenario: A verified unmet-need cluster becomes an opportunity case
    Given a demand cluster remains unsatisfied after a bounded procurement search
    When the cluster clears a predeclared opportunity threshold
    Then Storefront should create a versioned opportunity case with demand evidence, alternatives tried, required capabilities, economics, risks, collaborators, build-partner-buy options, and the smallest paid test
    And the case should preserve consented attribution to originating principals and Arks without promising equity, rewards, or service preference
    And the case should be available for challenge, provider response, venture review, or submission to an authorized corporate decision process

  Scenario: A solution closes the learning loop
    Given an unmet need is matched, procured, piloted, or answered by a new offer
    When the principal or authorized Ark evaluates the result
    Then Storefront should record whether the success test passed, realized price, time, failures, switching cost, and continuing gaps
    And the originating need and any derived opportunity should link to the fulfillment and value receipts
    And a failed solution should reopen or refine the need instead of being counted as fulfilled marketing volume
