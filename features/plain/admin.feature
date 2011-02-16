
Feature: Admin Actions

  As an admin
  I can see all companies
  And I can see a company detail
  
  Background:
    Given I am logged as an admin
  

  Scenario: I can see all companies
    Given there is a company with name "My First Company" in city "Monterrey"
    And there is a company with name "My Second Company" in city "Guadalajara"
    And there is a company with name "My Third Company" in city "Mexico, D. F."
    And I am on the company index
    Then I should see "My First Company"
    And I should see "Monterrey"
    And I should see "My Second Company"
    And I should see "Guadalajara"
    And I should see "My Third Company"
    And I should see "Mexico, D. F."
    
  Scenario: I can see a company detail
    Given there is a company with name "Company1" in city "Monterrey"
    And I am on the company index
    When I follow "Company1"
    Then I should see "Company1"
    And I should see "Monterrey"
    And I should see "This is my company"

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
    And I press "Crear"    
    Then I should see "La habilidad ha sido actualizada"    
    And I should see "Ruby on Rails"    

  Scenario: I can create a new required skill
    And there is a skill category with name "Front end"
    And I am on the new required skill page
    Then I fill in "required_skill_skill_name" with "Ruby on Rails"
    And I press "Crear"    
    Then I should see "La habilidad ha sido creada"    
    And I should see "Ruby on Rails"    

  
  Scenario: I can delete a required skill
    And there is a required skill with name "Javascript"
    And I am on the required skill index page
    And I should see "Javascript"
    When I follow "Borrar"
    Then I should see "La habilidad ha sido borrada"    
    And I should not see "Javascript"
 

 Scenario: I can see all skill categories
    And there is a skill category with name "Front end"
    And there is a skill category with name "Back end"
    And I am on the skill category index page
    And I should see "Front end"
    And I should see "Back end"
     
  Scenario: I can delete a skill category
    And there is a skill category with name "Back end"
    And I am on the skill category index page
    And I should see "Back end"
    When I follow "X"
    Then I should see "La categoria ha sido borrada"    
    And I should not see "Back end"
 
  Scenario: I can create a new skill category
    And I am on the new skill category page
    Then I fill in "skill_category_category" with "Front end"
    And I press "Crear"    
    Then I should see "La categoría ha sido creada"    
    And I should see "Front end"    

  Scenario: I can edit a skill category
    And there is a skill category with name "Front end"
    And I am on the skill category index page
    And I should see "Front end"
    When I follow "Editar"
    Then the "skill_category_category" field should contain "Front end"

  Scenario: I can update a skill category
    And there is a skill category with name "Front end"
    And I am on the skill category index page
    And I should see "Front end"
    When I follow "Editar"
    Then I fill in "skill_category_category" with "Back end"
    And I press "Crear"    
    Then I should see "La categoría ha sido actualizada"    
    And I should see "Back end"
    
    
    
    
    
