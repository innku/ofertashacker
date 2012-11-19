require 'fetchers/job_fetcher'
require 'unit/spec_helper'

describe 'JobFetcher' do
  describe '.search' do
    it 'searchs for 8 jobs with the filters specified' do
      Job.stub_chain(:filter_it, :order, :limit)
      Fetchers::JobFetcher.search(:filters => [])
    end
    
    it 'searchs for 8 unrepeated jobs with the filters specified if jobs_ids are specified' do
      Job.stub_chain(:filter_it, :order, :no_repeat, :limit)

      Fetchers::JobFetcher.search(:filters => [], :jobs_ids => [1,2])
    end
    
    it 'searchs for 8 jobs with the filters specified at a country if location_type is cpuntry' do
      Job.stub_chain(:filter_it, :order, :from_country, :limit)

      Fetchers::JobFetcher.search(:filters => [], :location_id => '2', :location_type => 'country')
    end
  end
end

