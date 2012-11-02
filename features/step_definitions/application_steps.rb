Given /^there is a city called "([^"]*)"$/ do |city_name|
  city = FactoryGirl.create(:city, :name => city_name)
end
