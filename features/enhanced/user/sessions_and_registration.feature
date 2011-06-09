@wip
Feature: User Actions

  As a user

  Background:
    Given there is a company with name "Company1" in city "Monterrey" and email "company1@mycompany.com"  
    And there is a job vacancy with title "Ruby Sr Programmer" created by "company1@mycompany.com"

  Scenario: I can contact a company without registering
    Given I am on the root page
    And I follow "Ruby Sr Programmer"
    When I follow "Contactar" 
    And I fill in "user_name" with "Foo bar"
    And I fill in "user_email" with "Foo bar"
    And I fill in "user_message" with "Foo bar"
    And I follow "Siguiente »"
    And I press "Contactar"
    Then I should see "nose"
