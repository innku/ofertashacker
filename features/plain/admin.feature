@admin
Feature: Admin Actions

  As an admin
  I want to see all required skills
  And edit a required skills
  And update a required skill
  And create a new required skill
  And delete a required skill 

  Background:
    Given I am logged as an admin

  Scenario: I can see all required skills
    And there is a required skill with name "Ajax"
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Ajax"
    And I should see "Javascript"

  Scenario: I can edit a required skill
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Javascript"
    When I follow "Editar"
    Then the "required_skill_skill_name" field should contain "Javascript"

  Scenario: I can update a required skill
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Javascript"
    When I follow "Editar"
    Then I fill in "required_skill_skill_name" with "Ruby on Rails"
    And I press "Actualizar"
    Then I should see "La habilidad ha sido actualizada"    
    And I should see "Ruby on Rails"

  Scenario: I can create a new required skill
    And I am on the new required skill page
    Then I fill in "required_skill_skill_name" with "Ruby on Rails"
    And I press "Actualizar"
    Then I should see "La habilidad ha sido creada"    
    And I should see "Ruby on Rails"    

  Scenario: I can delete a required skill
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Javascript"
    When I follow "X"
    Then I should see "La habilidad ha sido borrada"    
    And I should not see "Javascript"
  

