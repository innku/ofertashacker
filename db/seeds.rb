if Company.count.zero?
  admin = Company.find_or_create_by_role("admin", FactoryGirl.build(:company, :email=>"admin@sample.com", :role=>"admin").attributes)
  admin.update_attributes(:password => "secret", :password_confirmation => "secret")
end

if Job.count.zero?
  country1 = Metropoli::CountryModel.create(:name => "Argentina", :abbr => "AR")
  country2 = Metropoli::CountryModel.create(:name => "Brasil", :abbr => "BR")
  country3 = Metropoli::CountryModel.create(:name => "USA", :abbr => "US")
  country4 = Metropoli::CountryModel.create(:name => "Francia", :abbr => "FR")
  
  random_bool = [true, false]
  random_country = [country1.id, country2.id, country3.id, country4.id]
  41.times do |i|
    Job.create(:title => "Job #{i}", :created_at => DateTime.now - i.minutes, :country_id => random_country.sample, :full_time => true, :remote => random_bool.sample, :flexible => random_bool.sample, :extra_skill => "", :company_id => 1, :description => "A good job", :expiration_date => 60.days.from_now)
  end
end