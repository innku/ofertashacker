@companies
Feature: Company Actions

  As a company
  I want to register my company
  And see my company information
  
  Scenario: Register a company
    Given I am on the new company page
    When I fill in "company_title" with "Best Company"
    And I fill in "company_password_confirmation" with "mycompany"
    And I fill in "company_email" with "contact_me@best_company.com"
    And I fill in "company_password" with "mycompany"
    And I press "Registrar"
    Then I should see "Te has registrado correctamente"
    
  Scenario: Edit my company information
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And I am logged as a "company1@mycompany.com"
    And I am on the edit company page for "company1@mycompany.com"
    Then the "company_title" field should contain "Company1"
    And the "company_city" field should contain "Monterrey"
    And the "company_description" field should contain "This is my company"
    
  Scenario: Show my company information
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com" 
    And I am logged as a "company1@mycompany.com"
    And I am on the show company page for "company1@mycompany.com"
    Then I should see "Company1"
    And I should see "Monterrey"
    And I should see "This is my company"
    
    
