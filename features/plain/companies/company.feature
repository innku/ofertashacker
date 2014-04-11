@companies
Feature: Company Actions

  As a company
  I want to see my company information
  And edit my company information
  And update my company information

  Background:
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com" 
    And I am logged as a "sample@company.com"

  Scenario: I can view my company information
    When I follow "Perfil"
    Then I should see the company details for "sample@company.com"

  Scenario: I can edit my company information
    And I am on the edit company page for "sample@company.com"
    Then the "company_title" field should contain "Sample Company"
    And the "company_city_name" field should contain "Monterrey, Nuevo León, MX"
    And the "company_description" field should contain "This is my company"
    And the "company_contact_email" field should contain "foo@bar.com"
    And the "company_website" field should contain "www.foobar.com"
    And the "company_facebook" field should contain "foobar"
    And the "company_twitter" field should contain "foobar"


  Scenario: I can not delete my company
    And follow "Perfil"
    Then I should not see "Eliminar empresa"

  Scenario: See list of my jobs organized in tabs("Publicados| No publicados") on my perfil page
    And there is an expired job vacancy with title "Ruby Sr Programmer" created by "sample@company.com"
    And there is a job vacancy with title "Web Design" created by "sample@company.com"
    Then I follow "Perfil"
    And I should see "Web Design"
    Then I should see "Ruby Sr Programmer" with the button "Publicar" in ".expired" list

  Scenario: Can expire and publish vacancies from jobs list on my perfil page
    And there is an expired job vacancy with title "Ruby Sr Programmer" created by "sample@company.com"
    Then I follow "Perfil"
    And I should see "Ruby Sr Programmer" with the button "Publicar" in ".expired" list
    Then I follow "Publicar"
    Then I confirm the alert message
    And I should see "Ruby Sr Programmer" with the button "Expirar" in ".not-expired" list
    Then I follow "Expirar"
    Then I confirm the alert message
    And I should see "Ruby Sr Programmer" with the button "Publicar" in ".expired" list


  Scenario: See all my vacancies
    And there is a job vacancy with title "Ruby Sr Programmer" created by "sample@company.com"
    And there is a job vacancy with title "Web Design" created by "sample@company.com"
    And I am on my jobs page for "sample@company.com"
    Then I should see "Ruby Sr Programmer"
    And I should see "Web Design"

  Scenario: I can edit my own vacancies
    And there is a job vacancy with title "Ruby on Rails" created by "sample@company.com"
    And I am on the index job page
    And I follow "Ruby on Rails"
    When I follow "Editar"
    Then I should see "Datos de la oferta"

  Scenario: I can expire one of my own vacancies
    And there is a job vacancy with title "Ruby on Rails" created by "sample@company.com"
    And I am on the index job page
    And I follow "Ruby on Rails"
    Then I should see "Sacar de publicación"
    Then I follow "Sacar de publicación"
    Then I confirm the alert message
    Then I should see "La oferta fue expirada correctamente"
    Then I am on the index job page
    And I should not see "Ruby on Rails"

  Scenario: I can republish one of my own vacancies
    And there is an expired job vacancy with title "Ruby on Rails_expire" created by "sample@company.com"
    And I am on the index job page
    And I should not see "Ruby on Rails_expire"
    Then I follow "Mis ofertas"
    Then I follow "Ruby on Rails_expire"
    Then I should see a button called "Publicar"
    And I should not see "Sacar de publicación"
    Then I follow "Publicar"
    Then I confirm the alert message
    Then I should see "Tu oferta ha sido publicada y expirará dentro de 60 días"
    And I should see "Ruby on Rails_expire"

  Scenario: I can delete my own vacancies
    And there is a job vacancy with title "RoR" created by "sample@company.com"
    And I am on the index job page
    Then I follow "RoR"
    And I follow "Borrar"
    Then I confirm the alert message
    Then I should see "La oferta fue eliminada correctamente"

