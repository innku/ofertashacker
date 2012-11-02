if Company.count.zero?
  admin = Company.find_or_create_by_role("admin", FactoryGirl.build(:company, :email=>"admin@sample.com", :role=>"admin").attributes)
  admin.update_attributes(:password => "secret", :password_confirmation => "secret")
end


