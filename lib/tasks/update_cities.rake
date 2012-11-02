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
