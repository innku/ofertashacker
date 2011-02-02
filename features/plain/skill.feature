Feature: Required Skill cycle

  As a company
  I want to publish see required skills
  
  Background:
   Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"   
  @wip
  Scenario: I can see all required skills
    And I am logged as a "admin@rubypros.com"
    And there is a required skill with name "Ajax"
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Ajax"
    And I should see "Javascript"
