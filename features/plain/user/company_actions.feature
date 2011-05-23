Feature: User Actions

  As a user
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
    When I follow "company_logo"
    Then I should see the company details for "sample@company.com"

  Scenario: I can see a company detail
    Given there is a company with name "Sample Company" in city "Monterrey" and email "sample@company.com"
    And I am on the company index
    When I follow "Sample Company"
    Then I should see the company details for "sample@company.com"
    
  Scenario: I can register a company
    Given I am on the root page
    And I follow "¿Empresa?, Regístrate"
    When I fill in "company_title" with "Best Company"
    And I fill in "company_password_confirmation" with "mycompany"
    And I fill in "company_email" with "contact_me@best_company.com"
    And I fill in "company_password" with "mycompany"
    And I press "Registrar"
    Then I should see "Te has registrado con éxito."

