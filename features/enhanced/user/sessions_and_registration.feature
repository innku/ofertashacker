@wip
Feature: User Actions

  As a user

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And there is a job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"

  Scenario: I want to sign in
    Given there is a user with email "sample@user.com"
    Given I am on the root page
    And I follow "Ruby Sr Programmer"
    And I follow "Contactar"
    And I follow "Entrar" within ".overlay"
    When I fill in "user_email" with "sample@user.com"
    And I fill in "user_password" with "secret"
    And press "Ingresar"
    Then I should see "sample@user.com"
    And I should see "Message"

  Scenario: I want to sign out
  Scenario: When I am signed in I want to apply for a job by contacting the company
  Scenario: When I am not registrated in I want to apply for a job by contacting the company
  Scenario: I cannot register my account if I dont fill in the correct captcha

