@test
Feature: User Actions

  As a user
  I want to see vacancies
  And see vacancy details
  
  Scenario: I can view vacancies details
    Given there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am on the index job page
    When I follow "Ver más"
    Then I should see "Detalles de la Oferta"
  @test  
  Scenario: I can view a list of all vacancies
    Given there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am on the available job page
