@job_search
Feature: Search job

  As a visitor
  I want to search job vacancies by title, keyword or company name

  Background:
    Given there are "3" job vacancies with required skill "Ruby"
    And there is a job vacancy with title "Python developer" and required skill "Python"

  Scenario: I search Ruby from the searchbox
    And I am on the index job page
    When I fill in "search_job" with "Ruby"
    And I press "Buscar"
    Then I should see "Developer 1 Ruby"
    And I should see "Developer 2 Ruby"
    And I should see "Developer 3 Ruby"
    And I should not see "Python developer"

  Scenario: I search Python from the searchox
    And I am on the index job page
    When I fill in "search_job" with "Python"
    And I press "Buscar"
    Then I should see "Programador Python Django"
    And I should not see "Ruby developer"
    And I should not see "Ruby rockstar"

