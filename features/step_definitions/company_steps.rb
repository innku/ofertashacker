Given /^I am logged as a "([^"]*)"$/ do |email|
  @company = Company.find_by_email(email)
  visit new_company_session_path
  fill_in "company_email", :with => email
  fill_in "company_password", :with => "secret"
  click_button "company_submit"
end

Given /^there is a company with name "([^"]*)" in city "([^"]*)"$/ do |name, city|
  @company = Factory(:company, :title => name, :city => city)
end

Given /^there is a company with name "([^"]*)" in city "([^"]*)" and email "([^"]*)"$/ do |name, city, email|
  @company = Factory(:company, :title => name, :city => city, :email => email)
end

