Feature: Job Actions

  As a company
  I want to select required skills for my job opportunity
  
  Scenario: Add several skills to my job opportunity
    Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"  
    And there is a required skill with name "Ruby"  
    And I am logged as a "admin@rubypros.com"
    And I am on the new job page
    Then I should see "Ruby" within a li with class "skill"
    When I simulateclick "Ruby" within "li"
    Then I should see "Ruby" within a li with class "required_skill"
    And I should not see "Ruby" within a li with class "skill"

  Scenario: Edit skills of my job opportunity
    Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"  
    And there is a job vacancy with title "Ruby Jr Programmer" created by "admin@rubypros.com" with required skill "Ruby"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    And I follow "Editar"
    Then I should see "Ruby" within a li with class "required_skill"
    When I simulateclick "Ruby" within "li"
    Then I should see "Ruby" within a li with class "skill"



