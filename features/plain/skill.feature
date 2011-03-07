Feature: Required Skill cycle

  As a company
  I want to see all the existing skills of skill categories
  
  Scenario: I can see all required skills of one skill category
    Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"   
    And I am logged as a "admin@rubypros.com"
    And there is a skill category with name "Front end"
    And there is a required skill with name "Ajax"
    And there is a required skill with name "Javascript"
    And I am on the skill category index page
    When I follow "Ver"
    Then I should see "Front end"
    And I should see "Ajax"
    And I should see "Javascript"
