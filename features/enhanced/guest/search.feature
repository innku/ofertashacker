Feature: Search Actions

  @mytest
  Scenario: I can search jobs with from a particular country
    Given some jobs exists in Mexico and Brazil
    And I am on the root page
    When I search for Mexico
    Then I should only see the jobs from Mexico
