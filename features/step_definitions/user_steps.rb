Given /^there is a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Factory(:user, :email => email, :password => password, :password_confirmation => password)
end

Given /^there is a user signed in with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  user = User.find_by_email(email)
  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "user_submit"
end
