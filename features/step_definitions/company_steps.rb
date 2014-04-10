#encoding: utf-8;

Given /^I am logged as a "([^"]*)"$/ do |email|
  company = Company.find_by_email(email)
  visit new_company_session_path
  fill_in "company_email", :with => email
  fill_in "company_password", :with => "secret"
  click_button "company_submit"
end

Given /^there is a company with name "([^"]*)" in city "([^"]*)"$/ do |name, city_name|
  city = Metropoli::CityModel.find_by_name(city_name)
  if city.blank?
    city = FactoryGirl.create(:city, :name => city_name)
  end
  company = FactoryGirl.create(:company, :title => name, :city => city)
end

Given /^there is an expired job vacancy with title "(.*?)" created by "(.*?)"$/ do |title, company_email|
  company = Company.find_by_email(company_email)
  company = FactoryGirl.create(:company, :email => company_email, :city => "Monterrey") unless company
  job = FactoryGirl.create(:job, :title => title, :company => company)
  job.expire!
end


Given /^there is a company with name "([^"]*)" in city "([^"]*)" and email "([^"]*)"$/ do |name, city_name, email|
  city = FactoryGirl.create(:city, :name => city_name)
  company = FactoryGirl.create(:company, :title => name, :city => city, :email => email)
end

Then /^I should see the company details for "([^"]*)"$/ do |email|
  company = Company.find_by_email(email)

  page.should have_content(company.title)
  page.should have_content(company.city_name)
  page.should have_content(company.description)
  page.should have_content(company.website) unless company.website.blank? 
  page.should have_content(company.facebook) unless company.facebook.blank?   
  page.should have_content(company.twitter) unless company.twitter.blank? 
  page.should have_content(company.contact_email) unless company.contact_email.blank?
end

Given /^there is an old company with name "(.*?)" in a city "(.*?)"$/ do |title, city|
  company = FactoryGirl.build(:company, :title => title, :city2 => city, city: nil)
  company.save(:validate => false)
end

Then /^I should see a button called "(.*?)"$/ do |button_name|
  within('div.nav-buttons') do
    page.should have_link('Publicar')
  end
end


Given /^I select a job country from autocomplete field/ do
  selector = '.ui-menu-item a:contains(\"México\")'
  fill_in 'job_country_name', :with => 'México'
  sleep(3)
  page.execute_script " $('#{selector}').  trigger(\"mouseenter\").click();"
end

Given /^I fill the job information$/ do
  steps %Q{
    When I fill in "job_description" with "We need 2 ruby programmers"
    And I fill in "job_title" with "Ruby Sr Programmer"
    And I select a job country from autocomplete field
    And I check "job_full_time"
  }
end

Then /^the job should be created$/ do
  steps %Q{
    Then I should see "Tu oferta ha sido publicada y expirará dentro de 60 días"
    And I should see "Ruby Sr Programmer"
  } 
end

