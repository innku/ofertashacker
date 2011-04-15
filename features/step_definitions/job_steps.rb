When /^(?:|I )simulateclick "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  page.execute_script("$('#{selector}').click()")
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
