Given /^I am logged as an admin$/ do
  @admin_company = Company.find_by_role("admin")
  if !@admin_company
    @admin_company = Factory(:company,:email=>'admin@company.com', :role => "admin")
  end
  visit new_company_session_path
  fill_in "company_email", :with => @admin_company.email
  fill_in "company_password", :with => @admin_company.password
  click_button "company_submit"
end

Given /^there is a required skill with name "([^"]*)"$/ do |name|
  @required_skill = Factory(:required_skill, :skill_name => name)
end

Then /^(?:|I )should see "([^"]*)" within a li with class "([^"]*)"$/ do |text, selector|
  with_scope(".#{selector}") do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should not see "([^"]*)" within a li with class "([^"]*)"$/ do |text, selector|
  with_scope(".#{selector}") do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end

Then /^(?:|I )should see "([^"]*)" twice$/ do |text|
  twice_text = Regexp.new(text + "(.+)" + text, Regexp::MULTILINE)
  if page.respond_to? :should
    page.should have_xpath('//*', :text => twice_text)
  else
    assert page.has_xpath?('//*', :text => twice_text)
  end
end

When /^I fill the correct captcha$/ do
  Rack::Recaptcha.test_mode!
end

When /^I fill an incorrect captcha$/ do
  Rack::Recaptcha.test_mode! :return => false
end



When /^I wait "([^"]*)" seconds$/ do |n|
  sleep(n.to_i)
end

When /^I fill in "([^"]*)" with "([^"]*)" and wait for the element$/ do |field, value|
  fill_in(field, :with => value, :wait_for => :element, :element => field)
end
