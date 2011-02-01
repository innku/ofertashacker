Feature: User Actions

  As a user
  I want to see vacancies
  And see vacancy details
  
  Scenario: I can view vacancies details
    Given there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am on the available page
    When I follow "Ver más"
    Then I should see "Características"
    And I should see "Descripción"
  
  Scenario: I can view a list of all vacancies
    Given there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am on the available page
    Then I should see "Vacantes más recientes de Ruby Pros"
