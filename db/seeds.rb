namespace :db do
  desc 'Provide a base load of randomly generated (but valid) data for development'
  task :seed => [:reset, 'fixtures:load'] do

    # generate companys
    companies = []
    6.times { companies << Factory(:company) }
    # companies << Factory(:company, :email => 'admin@rubypros.com', :role => 'admin')
    # generate orders
    20.times { Factory(:job_seed, :company => companies.rand) }
  end
end
