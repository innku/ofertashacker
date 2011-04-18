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
    When I follow "Compañías" 
    And I follow "Company 1"
    And I follow "Eliminar empresa" and click OK
    And I follow "Compañías"
    Then I should not see "Company 1"
    Then I should see "Company 2"
