Given /^I am logged as an admin$/ do
  @admin_company = Company.find_by_role("admin")
  if !@admin_company
    @admin_company = Factory(:company, :role => "admin")
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



