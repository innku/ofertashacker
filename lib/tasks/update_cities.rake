require 'csv'

desc 'Updates de city attributes on Jobs and Companies'
task update_cities: :environment do
  puts "Updating cities on Jobs"
  Job.all.each do |j|
    j.city_name = j.city2
    j.save
  end

  puts "Updating cities on Companies"
  Company.all.each do |c|
    c.city_name = c.city2
    c.save
  end

  puts "Done"
end

namespace :metropoli do

  # Ej: rake metropoli:seed_city country=ve
  desc 'Add an specific country cities if a folder for the country exists in db/csv'
  task seed_city: :environment do
    country = ENV['country']
    begin
      countries = CSV.open(Rails.root + "db/csv/#{country}/countries.csv", 'r:UTF-8', :headers => true)
      states = CSV.open(Rails.root + "db/csv/#{country}/states.csv", 'r:UTF-8', :headers => true)
      cities = CSV.open(Rails.root + "db/csv/#{country}/cities.csv", 'r:UTF-8', :headers => true)
      puts 'Files loaded.'
    rescue
      puts 'There was an error opening your CSV data Files. Please check the documentation.'
    end

    begin
      include Metropoli::SeedHelper
      # encoding: UTF-8
      puts 'Loading countries..'
      migrate_from_csv(Metropoli::CountryModel, countries)
      puts 'Loading states..'
      migrate_from_csv(Metropoli::StateModel, states)
      puts 'Loading cities..'
      migrate_from_csv(Metropoli::CityModel, cities)

    rescue Exception => e
      puts 'There was an error processing your files'
      puts e.message
    end
  end
end
