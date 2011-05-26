require 'factory_girl'
if Company.count.zero?
  admin = Company.find_or_create_by_role("admin", Factory.build(:company, :email=>"admin@sample.com", :role=>"admin").attributes)
  admin.update_attributes(:password => "secret", :password_confirmation => "secret")
end


