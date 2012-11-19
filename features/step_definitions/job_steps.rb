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
  if !@company
    @company = FactoryGirl.create(:company, :email => email)
  end
  @job = FactoryGirl.create(:job, :company => @company, :title => title)
end

Given /^there is a job vacancy with title "([^"]*)" created by "([^"]*)" with required skill "([^"]*)"$/ do |title, email, rs|
  @company = Company.find_by_email(email)
  @rsa = FactoryGirl.create(:required_skill, :skill_name => rs)
  if !@company
    @company = FactoryGirl.create(:company, :email => email)
  end
  @job = FactoryGirl.create(:job, :company => @company, :title => title)
  @job.required_skill_ids_string="#{@rsa.id}"
end

Given /^there is a job vacancy with title "([^"]*)" created by "([^"]*)" and description "([^"]*)"$/ do |title, email, description|
  @company = Company.find_by_email(email)
  if !@company
    @company = FactoryGirl.create(:company, :email => email)
  end
  @job = FactoryGirl.create(:job, :company => @company, :title => title, :description => description)
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

Given /^some jobs exists in Mexico and Brazil$/ do
  brazil = FactoryGirl.create(:country, :name => 'Brazil')
  brazil_state = FactoryGirl.create(:state, :country => brazil)
  brazil_city = FactoryGirl.create(:city, :state => brazil_state)

  FactoryGirl.create(:job, :title => 'Monterrey 1')
  FactoryGirl.create(:job, :title => 'Monterrey 2')
  FactoryGirl.create(:job, :title => 'Sao Paolo', :city => brazil_city)
end

When /^I search for Mexico$/ do
  fill_in 'En:', :with => 'México'
  click_button 'Buscar'
end

Then /^I should only see the jobs from Mexico$/ do
  page.should have_content('Monterrey 1')
  page.should have_content('Monterrey 2')
  page.should_not have_content('Sao Paolo')
end
