@admin
Feature: Admin Actions
  As an admin
  I can delete a company

  Background:
    Given I am logged as an admin

  Scenario: I can delete a company
    Given there is a company with name "Company 1" in city "Monterrey"
    And there is a company with name "Company 2" in city "Monterrey"
    And I am on the root page
    When I follow "Empresas" 
    And I follow "Company 1"
    And I follow "Eliminar empresa" and click OK
    And I follow "Empresas"
    Then I should not see "Company 1"
    Then I should see "Company 2"
    
  Scenario: I can delete my company
    And I am on the root page
    And show me the page
    When I follow "Perfil"
    And I follow "Eliminar empresa" and click OK
    And I am on the company index
    Then I should not see "Sample Company"

  Scenario: When I delete my company my job vacancies are also deleted
    And there is a job vacancy with title "The Rails Master" created by "company1@mycompany.com" 
    When I am on the show company page for "company1@mycompany.com"
    And I follow "Eliminar empresa" and click OK
    And I am on the index job page
    Then I should not see "Rails Master"
