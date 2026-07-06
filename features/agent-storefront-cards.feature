@card @agent @economics @conscience
Feature: Agent storefront cards as real-world capability offers
  Storefront cards should behave like agent skills expanded into real-world
  procurement objects: they tell an agent how to get an outcome done, who or what
  fulfills it, what it costs, what evidence exists, and what authority is needed.

  Background:
    Given Storefront cards may represent software modules, support streams, agencies, ventures, certifications, human services, physical-world tasks, or hybrid offers
    And a principal-serving agent must protect the principal's money, authority, privacy, and long-term exit options

  Scenario: A card declares the outcome and fulfillment path
    Given an offer is listed as a Storefront card
    When an agent reads the card
    Then the card should declare the principal outcome, success definition, good-for and not-good-for segments, fulfillment modes, providers, dependencies, and verification artifacts
    And the fulfillment modes should distinguish software tools, agent skills, human services, agency support, certification, external vendors, physical-world actions, and legal or financial rails
    And the card should not imply real-world completion unless the completion path and verification artifacts are explicit

  Scenario: A card exposes authority, approvals, price, alternatives, and exit
    Given a card can cause spending, disclosure, contracting, or real-world coordination
    When an agent evaluates whether it may use the card
    Then the card should state what the agent can do alone, what requires principal approval, what Conscience gates apply, and what spending limits exist
    And it should include price model, expected value basis, break-even condition, renewal test, alternatives, cheaper paths, risks, exclusions, and exit or downgrade options
    And it should provide enough information for the agent to recommend, reject, negotiate, or request a better card

  Scenario: A card composes opportunity, supplier, skill, fulfillment, and receipt objects
    Given Storefront integrates business-model shapes, supplier appraisals, and agent skills
    When a card references lower-level objects
    Then it should be able to reference an opportunity card, supplier appraisal card, agent skill or tool card, real-world fulfillment path, authority policy, evidence bundle, and receipt schema
    And those references should be stable enough for an agent to retrieve, cache, cite, and audit later
    And the card should remain useful to humans while preserving the machine-readable contract
