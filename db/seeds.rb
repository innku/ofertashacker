namespace :db do
  desc 'Provide a base load of randomly generated (but valid) data for development'
  task :seed => [:reset, 'fixtures:load'] do
    # generate users
    companies = []
        Company.delete_all
    6.times { companies << Factory(:company) }
	    companies << Factory(:company, :email => 'user@company.com', :role => 'member')
    	companies << Factory(:company, :email => 'admin@company.com', :role => 'admin')
  end
end
