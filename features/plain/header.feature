Feature: Manage header options

	As an admin, a guest or a company
  I want to see the right menus on the header

  Background: 
    Given I am on the root page

  Scenario: As a guest I should see "Ofertas", "Empresas", "¿Empresa¿ Regístrate", "Iniciar sesión"
    Then I should see "Ofertas" on the header
    And I should see "Empresas" on the header
    And I should see "¿Empresa? Regístrate" on the header
    And I should see "Iniciar sesión" on the header
    And I should not see "Habilidades" on the header
    And I should not see "Publicar oferta" on the header
    And I should not see "Mi empresa" on the header
    And I should not see "Salir" on the header

  Scenario: As a company I should see "Ofertas", "Empresas", "Publicar oferta", "Mi empresa", "Salir"
    And there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com" 
    And I am logged as a "sample@company.com"
    Then I should see "Ofertas" on the header
    And I should see "Empresas" on the header
    And I should see "Publicar oferta" on the header
    And I should see "Mi empresa" on the header
    And I should see "Salir" on the header
    And I should not see "Habilidades" on the header
    And I should not see "¿Empresa? Regístrate" on the header
    And I should not see "Iniciar sesión" on the header


  Scenario: As an admin I should see "Ofertas", "Empresas", "Habilidades", "Publicar oferta", "Mi empresa", "Salir"
    And I am logged as an admin
    Then I should see "Ofertas" on the header
    And I should see "Empresas" on the header
    And I should see "Habilidades" on the header
    And I should see "Publicar oferta" on the header
    And I should see "Mi empresa" on the header
    And I should see "Salir" on the header
    And I should not see "¿Empresa? Regístrate" on the header
    And I should not see "Iniciar sesión" on the header