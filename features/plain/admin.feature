Feature: Admin Actions

  As an admin
  I can see all companies
  And I can see a company detail
  
  Background:
    Given I am logged as an admin
  
  Scenario: See all companies
    Given there is a company with name "My First Company" in city "Monterrey"
    And there is a company with name "My Second Company" in city "Guadalajara"
    And there is a company with name "My Third Company" in city "Mexico, D. F."
    And I am on the company index
    Then I should see "My First Company"
    And I should see "Monterrey"
    And I should see "My Second Company"
    And I should see "Guadalajara"
    And I should see "My Third Company"
    And I should see "Mexico, D. F."
    
  Scenario: See a company detail
    Given there is a company with name "Company1" in city "Monterrey"
    And I am on the company index
    When I follow "Company1"
    Then I should see "Company1"
    And I should see "Monterrey"
    And I should see "This is my company"