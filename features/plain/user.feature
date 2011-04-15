Feature: User Actions

  As a user
  I want to see vacancies
  And see vacancy details
  

  Scenario: I can view a list of all vacancies
    Given there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And there is a job vacancy with title "Sinatra developer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Jquery designer" created by "admin@rubypros.com"
    And I am on the root page
    Then I should see "RoR"
    And I should see "Sinatra developer"
    And I should see "Jquery designer"
