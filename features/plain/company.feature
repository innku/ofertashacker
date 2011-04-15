@companies
Feature: Company Actions

  As a company
  I want to see my company information
  And edit my company information
  And update my company information #Este scenario se encuentra en enhaced/company.feature
  
  Background:
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com" 
      
  Scenario: Show my company information
    Given I am logged as a "sample@company.com"
    And I am on the show company page for "sample@company.com"
    Then I should see "Sample Company"
    And I should see "Monterrey"
    And I should see "This is my company"
    
  Scenario: Edit my company information
    Given I am logged as a "sample@company.com"
    And I am on the edit company page for "sample@company.com"
    Then the "company_title" field should contain "Sample Company"
    And the "company_city" field should contain "Monterrey"
    And the "company_description" field should contain "This is my company"     
    
    
    
    
