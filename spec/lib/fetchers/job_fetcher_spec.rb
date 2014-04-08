require 'fetchers/job_fetcher'
require 'active_support/all' 
require 'unit/spec_helper'

describe 'JobFetcher' do
  describe '.search' do
    it 'searchs for 8 jobs with the filters specified' do
      Job.stub_chain(:not_expired, :filter_it, :next_jobs_batch) 
      Fetchers::JobFetcher.search(:filters => [])
    end
    
    it 'searchs for 8 jobs with the filters specified at a country if location_type is cpuntry' do
      Job.stub_chain(:not_expired, :filter_it, :from_country, :next_jobs_batch)

      Fetchers::JobFetcher.search(:filters => [], :location_id => '2', :location_type => 'country')
    end
    
    it 'searchs for 8 unrepeated jobs with the keywords specified if keywords are specified' do
      Job.stub_chain(:not_expired, :filter_it, :with_keywords, :next_jobs_batch, :not_expired)

      Fetchers::JobFetcher.search(:filters => [], :keywords => "elias")
    end
  end
end

