Feature: Search job

  As a visitor
  I want to search job vacancies by title, keyword or company name

  Background:
    Given there are "3" job vacancies with required skill "Ruby"
    And there is a job vacancy with title "Python developer" and required skill "Python"

  Scenario: I can search with the flags in the header of the countries installed
    Given there is a venezuelan job vacancy 
    And I am on the index job page
    And I click the venezuelan flag link
    Then I should only see the job vacancies from venezuela
