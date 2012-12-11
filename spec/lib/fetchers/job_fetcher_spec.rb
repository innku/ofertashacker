require 'fetchers/job_fetcher'
require 'active_support/all' 
require 'unit/spec_helper'

describe 'JobFetcher' do
  describe '.search' do
    it 'searchs for 8 jobs with the filters specified' do
      Job.stub_chain(:filter_it, :random) 
      Fetchers::JobFetcher.search(:filters => [])
    end
    
    it 'searchs for 8 unrepeated jobs with the filters specified if jobs_ids are specified' do
      Job.stub_chain(:filter_it, :no_repeat, :random)

      Fetchers::JobFetcher.search(:filters => [], :jobs_ids => [1,2])
    end
    
    it 'searchs for 8 jobs with the filters specified at a country if location_type is cpuntry' do
      Job.stub_chain(:filter_it, :from_country, :random)

      Fetchers::JobFetcher.search(:filters => [], :location_id => '2', :location_type => 'country')
    end
    
    it 'searchs for 8 unrepeated jobs with the keywords specified if keywords are specified' do
      Job.stub_chain(:filter_it, :with_keywords, :random)

      Fetchers::JobFetcher.search(:filters => [], :keywords => "elias")
    end
  end
end

