When /^(?:|I )simulateclick "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  page.execute_script("$('#{selector}').click()")
end
