@user
Feature: User Actions

  As a user
  I want to see all vacancies
  And see a vacancy detail through the index job page
  And see a vacancy detail through the company detail page
  And see a vacancy detail through the root page
  And see all companies
  And see a company detail
  And I can register my company

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
  
  Scenario: I can see all companies
    Given there is a company with name "My First Company" in city "Monterrey"
    And there is a company with name "My Second Company" in city "Guadalajara"
    And I am on the company index
    Then I should see "My First Company"
    And I should see "Monterrey"
    And I should see "My Second Company"
    And I should see "Guadalajara"

  Scenario: I can see a company detail through a job vacancy from that company
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And there is a job vacancy with title "Ruby on Rails" created by "sample@company.com"
    And I am on the show job page for "Ruby on Rails"
    When I follow "company_logo"
    Then I should see the company details for "sample@company.com"

  Scenario: I can see a company detail
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And I am on the company index
    When I follow "Sample Company"
    Then I should see the company details for "sample@company.com"
    
  Scenario: I can register a company
    Given I am on the root page
    And I follow "¿Empresa?, Regístrate"
    When I fill in "company_title" with "Best Company"
    And I fill in "company_password_confirmation" with "mycompany"
    And I fill in "company_email" with "contact_me@best_company.com"
    And I fill in "company_password" with "mycompany"
    And I press "Registrar"
    Then I should see "Te has registrado con éxito."

