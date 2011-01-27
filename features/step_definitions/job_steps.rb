When /^(?:|I )simulateclick "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  page.evaluate_script("$('\##{selector}').click()")
end
