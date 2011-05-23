Feature: Company Actios
  As a company I want to edit other companies
  And manage the required skills

  Background:
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com" 
    And I am logged as a "sample@company.com"

  Scenario: I can not edit other companies
    And there is a company with name "Other Company" in city "Monterrey" and email "other@company.com" 
    When I follow "Empresas"
    And I follow "Other Company"
    Then I should not see "Editar"

  Scenario: I cannot edit other companies vacancies
    And there is a job vacancy with title "Ruby on Rails" created by "company_example@company_example.com"
    And I am on the index job page
    When  I follow "Ruby on Rails"
    Then I should not see "Editar"

  Scenario: I can not delete other companies
    And there is a company with name "Other Company" in city "Monterrey" and email "other@company.com" 
    When I follow "Empresas"
    And I follow "Other Company"
    Then I should not see "Eliminar empresa"

  Scenario: I can't access the required skills page
    When I am on the required skill index page
    Then I should see "No estas autorizado para ver esta página"

  Scenario: I can't create a new required skill
    When I am on the new required skill page
    Then I should see "No estas autorizado para ver esta página"

  Scenario: I can't edit a required skill
    And there is a required skill with name "Javascript"
    When I am on the edit required skill page for "Javascript"
    Then I should see "No estas autorizado para ver esta página"

  Scenario: I can't see the skills option on the main menu
    When I am on the root page
    Then I should see "Salir"
    And I should not see "Skills"
