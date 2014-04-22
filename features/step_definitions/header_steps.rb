Then /^I should see "(.*?)" on the header$/ do |menu_item|
	within("#header .topMenu") do
      page.should have_content menu_item
    end
end

Then /^I should not see "(.*?)" on the header$/ do |menu_item|
	within("#header .topMenu") do
   	  page.should_not have_content menu_item
    end
end
