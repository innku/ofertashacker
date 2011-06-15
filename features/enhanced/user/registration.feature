@user_registration
Feature: User Actions

  As a user
  I want to contact a company
  And I want to register my personal information

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And there is a job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"
    And I am on the root page
    And I follow "Ruby Sr Programmer"
    And I follow "Contactar" 

  Scenario: I can contact a company without registering
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I fill in "user_message" with "Foo bar"
    And I wait "2" seconds
    And I follow "Enviar Mensaje"
    And I press "Sólo enviar el mensaje"
    Then I should see "Tu correo fue enviado a la empresa, espera su respuesta."

  Scenario: I can contact a company and register at the same time
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I fill in "user_message" with "Foo bar"
    And I wait "2" seconds
    And I follow "Enviar Mensaje"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I press "Registrarme"
    Then I should not see "Tu correo fue enviado a la empresa, espera su respuesta."

  Scenario: When I am on the Sign in lightbox I can go back to the Registration form
    And I follow "Entrar" within ".overlay"
    And I should see "Iniciar sesión"
    And I wait "5" seconds
    When I follow "Regístrate" within "#sign_in"
    Then I should see "¿Qué le quieres decir a la empresa?"
    And I should see "Enviar Mensaje" within "#registration"

  Scenario: I can't contact a company if I don't enter an email
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    Then I should see "no puede estar vacío"

  Scenario: I can't contact a company if I don't enter an name
    When I fill in "user_email" with "foo@bar.com"
    And I fill in "user_message" with "Foo bar"
    Then I should see "no puede estar vacío"

  Scenario: I can't contact a company if I don't enter an message
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I follow "Enviar Mensaje"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I press "Registrarme"
    Then I should see "no puede estar vacío"

  Scenario: I can contact a company by simply filling in the name, email and message
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I follow "Enviar Mensaje"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I press "Registrarme"
    Then I should see "Tu correo fue enviado a la empresa, espera su respuesta."
