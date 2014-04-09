Feature: Manage Heroku scheduler

	Background:
		Given that there is a job that expires today
	
	Scenario: An email is sent to the job owner saying the job is expired.
    Given the schedule task runs 
    Then the job owner should receive an email saying the job is expired.