# encoding: utf-8;

When /^I follow "([^"]*)" and click OK$/ do |text|
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
  When %{I follow "#{text}"}
end

Given /^there are "([^"]*)" job vacancies of each job type$/ do |number|
  company = FactoryGirl.create(:company)
  number.to_i.times do
    FactoryGirl.create(:job, :full_time => true, :part_time => false, :flexible => false, :remote => false, :company => company, :title => "Trabajo de Tiempo Completo")
    FactoryGirl.create(:job, :full_time => false, :part_time => true, :flexible => false, :remote => false, :company => company, :title => "Trabajo de Medio Tiempo")
    FactoryGirl.create(:job, :full_time => false, :part_time => false, :flexible => false, :remote => true, :company => company, :title => "Trabajo Remoto")
    FactoryGirl.create(:job, :full_time => false, :part_time => false, :flexible => true, :remote => false, :company => company, :title => "Trabajo de Horario Flexible")
  end
end

Given /^there is a job vacancy of each job type$/ do
  company = FactoryGirl.create(:company)
  FactoryGirl.create(:job, :full_time => true, :part_time => false, :flexible => false, :remote => false, :company => company, :title => "Trabajo de Tiempo Completo")
  FactoryGirl.create(:job, :full_time => false, :part_time => true, :flexible => false, :remote => false, :company => company, :title => "Trabajo de Medio Tiempo")
  FactoryGirl.create(:job, :full_time => false, :part_time => false, :flexible => false, :remote => true, :company => company, :title => "Trabajo Remoto")
  FactoryGirl.create(:job, :full_time => false, :part_time => false, :flexible => true, :remote => false, :company => company, :title => "Trabajo de Horario Flexible")
end


Given /^there is a job vacancy with title "([^"]*)" created by "([^"]*)"$/ do |title, email|
  @company = Company.find_by_email(email)
  @company = FactoryGirl.create(:company, :email => email) unless @company
  @job = FactoryGirl.create(:job, :company => @company, :title => title)
end

Given /^there is a job vacancy with title "([^"]*)" created by "([^"]*)" and description "([^"]*)"$/ do |title, email, description|
  @company = Company.find_by_email(email)
  @company = FactoryGirl.create(:company, :email => email) unless @company
  @job = FactoryGirl.create(:job, :company => @company, :title => title, :description => description)
end

Given /^there is a job vacancy with title "([^"]*)" and required skill "([^"]*)"$/ do |title, rs|
  @rsa = FactoryGirl.create(:required_skill, :skill_name => rs)
  @job = FactoryGirl.create(:job, :title => title)
  @job.required_skills << @rsa
end

Given /^there are "([^"]*)" job vacancies with required skill "([^"]*)"$/ do |number, rs|
  n = number.to_i
  rsa = FactoryGirl.create(:required_skill, skill_name: rs)
  n.times do |i|
    job = FactoryGirl.create(:job, title: "Developer #{i+1} #{rs}")
    job.required_skills << rsa
  end
end

Then /^I should see the job vacancy details for "([^"]*)"$/ do |job_name|
  job = Job.find_by_title(job_name)
  
  page.should have_content(job.title)
  page.should have_content(job.city)
  page.should have_content(job.description)
  page.should have_content("Tiempo Completo") unless job.full_time.blank? 
  page.should have_content("Medio Tiempo") unless job.part_time.blank?   
  page.should have_content("Horario Flexible") unless job.flexible.blank? 
  page.should have_content("Remoto") unless job.remote.blank?
end

Given /^there is an old job vacancy with title "(.*?)" created by "(.*?)" in city "(.*?)"$/ do |title, email, city|
  j = Job.new(:title => title, :full_time => true, :description => 'elias', company: FactoryGirl.create(:company), city2: city)
  @company = Company.find_by_email(email)
  if !@company
    @company = FactoryGirl.create(:company, :email => email)
  end
  j.save(:validate => false)
end


Given /^there is a venezuelan job vacancy$/ do
  ve = FactoryGirl.create(:country, :name => 'Venezuela', :abbr => 'VE')
  ve_state = FactoryGirl.create(:state, country: ve)
  ve_city = FactoryGirl.create(:city, state: ve_state)

  job = FactoryGirl.create(:job, :title => 'Venezuelan job', country_name: ve.name, city_name: ve_city.name)
end

Given /^I visit ofertashacker\.com\/ve$/ do
  visit '/ve'
end

Given /^I should only see the job vacancies from venezuela$/ do
   page.should have_content "Venezuelan job"
   page.should_not have_content "Developer 1 Ruby"
   page.should_not have_content "Developer 2 Ruby"
   page.should_not have_content "Developer 3 Ruby"
   page.should_not have_content "Python developer"
end

Given /^I click the venezuelan flag link$/ do
  find("img[@alt='ve_flag']").click
end
