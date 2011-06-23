@user
Feature: User Actions

  As a user
  I want to contact a company

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And there is a job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"
    And I am on the root page
    And I follow "Ruby Sr Programmer"
    And I follow "Contactar" 

  Scenario: I can contact a company
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I fill in "user_message" with "Foo bar"
    And I press "Enviar Mensaje"
    Then I should see "Tu correo fue enviado a Company1 correctamente."

  Scenario: I can't contact a company if I don't enter an email
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    And I press "Enviar Mensaje"
    Then I should see "requerido"
    And I should not see "Tu correo fue enviado a Company1 correctamente."
  
  Scenario: I can't contact a company if I enter an invalid email
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    And I fill in "user_email" with "foobar"
    And I press "Enviar Mensaje"
    Then I should see "es inválido"
    And I should not see "Tu correo fue enviado a Company1 correctamente."

  Scenario: I can't contact a company if I don't enter an name
    When I fill in "user_email" with "foo@bar.com"
    And I fill in "user_message" with "Foo bar"
    And I press "Enviar Mensaje"
    Then I should see "requerido"
    And I should not see "Tu correo fue enviado a Company1 correctamente."

  Scenario: I can't contact a company if I don't enter an message
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I press "Enviar Mensaje"
    Then I should see "requerido"
    And I should not see "Tu correo fue enviado a Company1 correctamente."

  Scenario: I can contact a company by simply filling in the name, email and message
    When I fill in "user_name" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    And I fill in "user_email" with "foo@bar.com"
    And I press "Enviar Mensaje"
    Then I should see "Tu correo fue enviado a Company1 correctamente."
