@job_search
Feature: Search job

  As a visitor
  I want to search job vacancies by title, keyword or company name

  Background:
    Given there are "3" job vacancies with required skill "Ruby"
    And there is a job vacancy with title "Python developer" and required skill "Python"

    @mytest
  Scenario: I search Ruby from the searchbox
    And I am on the index job page
    When I fill in "Busco:" with "Ruby"
    And I press "Buscar"
    Then I should see "Developer 1 Ruby"
    And I should see "Developer 2 Ruby"
    And I should see "Developer 3 Ruby"
    And I should not see "Python developer"
