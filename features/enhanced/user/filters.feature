@filters
Feature: User Actions
  As an user
  I want to filter the job vacancies

  Background:
    Given there is a job vacancy of each job type

  #Unchecking only one job type
  Scenario: I uncheck full time, so jobs that have only full time as a job type will no longer appear
    And I am on the index job page
    When I uncheck "full_time"
    Then I should not see "Trabajo de Tiempo Completo"
    And I should see "Trabajo de Medio Tiempo"
    And I should see "Trabajo Remoto"
    And I should see "Trabajo de Horario Flexible"

  Scenario: I uncheck part time, so jobs that have only part time as a job type will no longer appear
    And I am on the index job page
    When I uncheck "part_time"
    Then I should not see "Trabajo de Medio Tiempo"
    And I should see "Trabajo de Tiempo Completo"
    And I should see "Trabajo Remoto"
    And I should see "Trabajo de Horario Flexible"

  Scenario: I uncheck flexible, so jobs that have only flexible as a job type will no longer appear
    And I am on the index job page
    When I uncheck "flexible"
    Then I should not see "Trabajo de Horario Flexible"
    And I should see "Trabajo de Medio Tiempo"
    And I should see "Trabajo Remoto"
    And I should see "Trabajo de Tiempo Completo"

  Scenario: I uncheck remote, so jobs that have only remote as a job type will no longer appear
    And I am on the index job page
    When I uncheck "remote"
    Then I should not see "Trabajo Remoto"
    And I should see "Trabajo de Medio Tiempo"
    And I should see "Trabajo de Tiempo Completo"
    And I should see "Trabajo de Horario Flexible"

  #Unchecking two job types
  Scenario: I uncheck full time and part time, so jobs that have only full time and part time as a job type will no longer appear
    And I am on the index job page
    When I uncheck "full_time"
    And I uncheck "part_time"
    Then I should not see "Trabajo de Tiempo Completo"
    And I should not see "Trabajo de Medio Tiempo"
    And I should see "Trabajo Remoto"
    And I should see "Trabajo de Horario Flexible"

  Scenario: I uncheck remote and flexible, so jobs that have only remote and flexible as a job type will no longer appear
    And I am on the index job page
    When I uncheck "remote"
    And I uncheck "flexible"
    Then I should not see "Trabajo Remoto"
    And I should not see "Trabajo de Horario Flexible"
    And I should see "Trabajo de Medio Tiempo"
    And I should see "Trabajo de Tiempo Completo"

  #Unchecking three job types
  Scenario: I uncheck full time, part time and remote, so only the jobs that have flexible as a job type will appear
    And I am on the index job page
    When I uncheck "full_time"
    And I uncheck "part_time"
    And I uncheck "remote"
    Then I should see "Trabajo de Horario Flexible"
    And I should not see "Trabajo de Tiempo Completo"
    And I should not see "Trabajo de Medio Tiempo"
    And I should not see "Trabajo Remoto"

  #Unchecking all job types
  Scenario: When uncheck all job types I should see all jobs
    And I am on the index job page
    When I uncheck "full_time"
    And I uncheck "part_time"
    And I uncheck "remote"
    And I uncheck "flexible"
    Then I should see "Trabajo de Tiempo Completo"
    And I should see "Trabajo de Medio Tiempo"
    And I should see "Trabajo de Horario Flexible"
    And I should see "Trabajo Remoto"

  Scenario: I uncheck all job types, and the four job type checkboxes should be checked again
    And I am on the index job page
    When I uncheck "full_time"
    And I uncheck "part_time"
    And I uncheck "remote"
    And I uncheck "flexible"
    Then the "full_time" checkbox should be checked
    Then the "part_time" checkbox should be checked
    Then the "flexible" checkbox should be checked
    Then the "remote" checkbox should be checked
