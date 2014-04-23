Feature: Guest Actions

  As a guest
  I want to see all companies
  And also see the information of each company

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
    When I follow "Sample Company"
    Then I should see the company details for "sample@company.com"

  Scenario: I can see a company detail
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And I am on the company index
    When I follow "Sample Company"
    Then I should see the company details for "sample@company.com"
    
  Scenario: I can register a company
    Given I am on the root page
    And I follow "¿Empresa? Regístrate"
    When I fill in "company_title" with "Best Company"
    And I fill in "company_password_confirmation" with "mycompany"
    And I fill in "company_email" with "contact_me@best_company.com"
    And I fill in "company_password" with "mycompany"
    And I press "Registrar"
    Then I should see "¡Listo! Tu empresa ya está registrada, ahora puedes publicar una oferta."

  Scenario: I can see a fallback of the company city
    Given there is an old company with name "My First Company" in a city "weird city"
    And I am on the company index
    Then I should see "weird city"
    When I follow "My First Company"
    Then I should see "weird city"

  Scenario: I can't see a company's expired vacancies
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And there is an expired job vacancy with title "Ruby Sr Programmer" created by "sample@company.com"
    And there is a job vacancy with title "Ruby on Rails" created by "sample@company.com"
    And I am on the company index
    When I follow "Sample Company"
    Then I should not see "Ruby Sr Programmer"
    And I should see "Ruby on Rails"
    Then I should not see "Ruby on Rails" with the button "Expirar" in ".not-expired" list