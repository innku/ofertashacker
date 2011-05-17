Feature: Company Actions

  As a company
  I want to update my company information

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And I am logged as a "company1@mycompany.com"

  Scenario: Update my company information
    And I am on the edit company page for "company1@mycompany.com"
    When I fill in "company_title" with "Best Company"
    And I fill in "company_city" with "San Nicolas de los Garza"
    And I fill in "company_description" with "The best company around the world"
    And I press "Actualizar"
    Then I should see "Tu información ha sido actualizada"
    And I should see "Best Company"
    And I should see "San Nicolas de los Garza"
    And I should see "The best company around the world"


  Scenario: Publish a new job vacancy
    And I am on the new job page
    When I fill in "job_description" with "We need 2 ruby programmers"
    And I fill in "job_title" with "Ruby Sr Programmer"
    And I fill in "job_city" with "Monterrey"
    And I check "job_full_time"
    And I press "Publicar oferta"
    Then I should see "Tu oferta ha sido publicada"  
    And I should see "Ruby Sr Programmer"
