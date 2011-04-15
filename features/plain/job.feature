@wip  
Feature: Job cycle

  As a company
  I want to update a job vacancy
  And I want to delete a job vacancy
  And I want to see all my vacancies
  
  Background:
   Given there is a company with name "RubyPros Company" in city "Monterrey" and email "admin@rubypros.com"   
  
  Scenario: See all my vacancies
    And there is a job vacancy with title "Ruby Sr Programmer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Ruby Jr Programmer" created by "admin@rubypros.com"
    And there is a job vacancy with title "Web Design" created by "admin@rubypros.com"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    Then I should see "Ruby Sr Programmer"
    And I should see "Ruby Jr Programmer"
    And I should see "Web Design"
     
  Scenario: I can edit my own vacancies
    And there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    And I follow "RoR"
    When I follow "Editar"
    Then I should see "Datos de la oferta"
      
  Scenario: I cannot edit other Companies vacancies
    And there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And there is a company with name "INNKU" in city "Monterrey" and email "admin@innku.com"  
    And I am logged as a "admin@innku.com"
    And I am on the index job page
    Then I should not see "Actualizar Oferta"

  Scenario: I can delete my own vacancies
    And there is a job vacancy with title "RoR" created by "admin@rubypros.com"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    Then I follow "RoR"
    And I follow "Borrar"
    Then I should see "La vacante fue eliminada correctamente"

  Scenario: I can view vacancies details
    And there is a job vacancy with title "RoR" created by "admin@rubypros.com" and description "Foo bar description"
    And I am logged as a "admin@rubypros.com"
    And I am on the index job page
    When I follow "RoR"
    Then I should see "Foo bar description"
      
      
