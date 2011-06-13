@wip

Feature: User Actions

  As a user
  I want to contact a company
  And I sign in

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And there is a job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"
    And there is a user with email "foo@bar.com" and password "secret"

  Scenario: I can sign in before contacting a company
    Given I am on the root page
    And I follow "Ruby Sr Programmer"
    When I follow "Contactar" 
    And I follow "Entrar" within ".overlay"
    And I wait "2" seconds
    And I fill in "user_email" with "foo@bar.com" within "#sign_in"
    And I fill in "user_password" with "secret" within "#sign_in"
    And I press "Entrar"
    Then I should see "Mensaje"
    And I should see "foo@bar.com"
    And I should see "Contactar"

  Scenario: I can change the user when another one is signed in
    Given there is a user signed in with email "foo@bar.com" and password "secret"
    And I am on the root page
    And I follow "Ruby Sr Programmer"
    When I follow "Contactar" 
    And I follow "Estos no son mis datos"
    Then I should see "Iniciar sesión"
    And I should see "Email"
    And I should see "Contraseña"

  Scenario: I can't sign in if I enter a wrong email or password
    Given I am on the root page
    And I follow "Ruby Sr Programmer"
    And I follow "Contactar"
    And I follow "Entrar" within ".overlay"
    When I fill in "user_email" with "foo@.com" within "#sign_in"
    And I fill in "user_password" with "secreto" within "#sign_in"
    And I press "Entrar" within "#sign_in"
    Then I should see "Contraseña o email inválido"

  Scenario: I can contact any company when I am already logged in
    Given there is a user signed in with email "foo@bar.com" and password "secret"
    And I am on the root page
    And I follow "Ruby Sr Programmer"
    When I follow "Contactar"
    Then I should see "Mensaje"
    And I should see "foo@bar.com"
    And I wait "2" seconds
    And I should see "Estos no son mis datos"
