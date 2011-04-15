Feature: Required Skill cycle

  As a company
  I want to see all the existing required skills
  
  Scenario: I can see all required skills
    Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"   
    And I am logged as a "admin@rubypros.com"
    And there is a required skill with name "Ajax"
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    Then I should see "Ajax"
    And I should see "Javascript"
