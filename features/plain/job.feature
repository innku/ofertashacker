Feature: Job cycle

  As a company
  I want to publish a job vacancy
  And I want to update a job vacancy
  And I want to delete a job vacancy
  And I want to see all my vacancies
  
  Scenario: Publish a new job vacancy
   Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"  
   And I am logged as a "admin@rubypros.com"
   And I am on the new job page
   When I fill in "job_title" with "Ruby Sr Programmer"
   And I fill in "job_state" with "Nuevo Leon"
   And I check "job_full_time"
   And I check "job_part_time"
   And I fill in "job_description" with "We need 2 ruby programmers"
   And I press "Crear"
   Then I should see "Tu oferta se ha publicada"
   
  Scenario: See all my vacancies
    Given there is a job vacancy with title "Ruby Sr Programmer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Ruby Jr Programmer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Web Design" created by "admin@rubypros.com"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    Then I should see "Ruby Sr Programmer"
    And I should see "Ruby Jr Programmer"
    And I should see "Web Design"
     
    