Feature: Company Actions

  As a company
  I want to update my company information

  Scenario: Update my company information
      Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
      And I am logged as a "company1@mycompany.com"
      And I am on the edit company page for "company1@mycompany.com"
      When I fill in "company_title" with "Best Company"
      And I fill in "company_city" with "San Nicolas de los Garza"
      And I fill in "company_description" with "The best company around the world"
      And I press "Actualizar"
      Then I should see "Tu información ha sido actualizada"
      And I should see "Best Company"
      And I should see "San Nicolas de los Garza"
      And I should see "The best company around the world"
