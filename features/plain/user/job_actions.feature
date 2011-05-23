@user
Feature: User Actions

  As a user
  I want to see all vacancies
  And also see the information of each vacancy
  
  Scenario: I can view a list of all vacancies
    And there is a job vacancy with title "Sinatra developer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Jquery designer" created by "admin@rubypros.com"
    And I am on the root page
    And I should see "Sinatra developer"
    And I should see "Jquery designer"
    
  Scenario: I can see a vacancy detail through the index job page
    Given there is a job vacancy with title "Ruby on Rails" created by "admin@rubypros.com"
    And I am on the index job page
    When I follow "Ruby on Rails"
    Then I should see the job vacancy details for "Ruby on Rails"
    
  Scenario: I can see a vacancy detail through the company detail page
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And there is a job vacancy with title "Ruby on Rails" created by "sample@company.com"
    And I am on the show company page for "sample@company.com"
    When I follow "Ruby on Rails"
    Then I should see the job vacancy details for "Ruby on Rails"

  Scenario: I can see a vacancy detail through the root page
    Given there is a job vacancy with title "Ruby on Rails" created by "admin@rubypros.com"
    And I am on the root page
    When I follow "Ruby on Rails"
    Then I should see the job vacancy details for "Ruby on Rails"
  
