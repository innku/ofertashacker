Feature: Company Actions

  As a company
  I want to update my company information

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And I am logged as a "company1@mycompany.com"

  Scenario: Update my company information
    Given there is a city called "San Nicolas de los Garza"
    And I am on the edit company page for "company1@mycompany.com"
    When I fill in "company_title" with "Best Company"
    And I fill in "company_city_name" with "San Nicolas de los Garza, Nuevo León, MX"
    And I fill in "company_description" with "The best company around the world"
    And I press "Actualizar"
    Then I should see "Tu información ha sido actualizada"
    And I should see "Best Company"
    And I should see "San Nicolas de los Garza"
    And I should see "The best company around the world"

  Scenario: Publish a new job vacancy
    Given I am on the new job page
    And I fill the job information
    When I press "Publicar oferta"
    Then the job should be created

  Scenario: Can expire and publish vacancies from jobs list on my perfil page
    And there is an expired job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"
    Then I follow "Mi empresa"
    And I should see "Ruby Sr Programmer" with the button "Publicar" in ".expired" list
    Then I follow "Publicar"
    Then I confirm the alert message
    And I should see "Ruby Sr Programmer"
    And I should see "Expirar"
    Then I follow "Expirar"
    Then I confirm the alert message
    And I should not see "Ruby Sr Programmer"

  Scenario: I can expire one of my own vacancies
    And there is a job vacancy with title "Ruby on Rails" created by "company1@mycompany.com"
    And I am on the index job page
    And I follow "Ruby on Rails"
    Then I should see "Expirar"
    Then I follow "Expirar"
    Then I confirm the alert message
    Then I should see "La oferta fue expirada correctamente"
    Then I am on the index job page
    And I should not see "Ruby on Rails"

  Scenario: I can republish one of my own vacancies
    And there is an expired job vacancy with title "Ruby on Rails_expire" created by "company1@mycompany.com"
    And I am on the index job page
    And I should not see "Ruby on Rails_expire"
    Then I follow "Mi empresa"
    Then I follow "Ruby on Rails_expire"
    Then I should see a button called "Publicar"
    And I should not see "Expirar"
    Then I follow "Publicar"
    Then I confirm the alert message
    And I should see "Tu oferta ha sido publicada y expirará dentro de 60 días"
    And I should see "Expirar"
    And I should see "Ruby on Rails_expire"

  Scenario: I can delete my own vacancies
    And there is a job vacancy with title "RoR" created by "company1@mycompany.com"
    And I am on the index job page
    Then I follow "RoR"
    And I follow "Borrar"
    Then I confirm the alert message
    Then I should see "La oferta fue eliminada correctamente"

