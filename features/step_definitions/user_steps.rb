Given /^there is a user with email "([^"]*)"$/ do |email|
  Factory(:user, :email => email)
end
