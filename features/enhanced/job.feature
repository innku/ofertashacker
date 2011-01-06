Feature: Job Actions

  As a company
  I want to select required skills for my job opportunity
  
  Scenario: Add several skills to my job opportunity
    Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"  
    And I am logged as a "admin@rubypros.com"
    And I am on the new job page
    When I select "Ruby" from "li"
    And I select "Ajax" from "li"
    And I select "MySql" from "li"
    Then I should see "Ruby" within "job_required_profile"
    And I should see "Ajax" within "job_required_profile"
    And I should see "MySql" within "job_required_profile"
    Then I should not see "Ruby" within "li"
    And I should not see "Ajax" within "li"
    And I should not see "MySql" within "li"
     