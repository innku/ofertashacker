require 'spec_helper'

describe Job do

  before do
    @job = Factory(:job)
  end

  context 'Validations' do

    context 'Company is valid' do
      it "With all attributes" do
        @job.should be_valid
      end
    end

    context 'Company is not valid' do
      it "Without a an associated company" do
        @job.company_id=nil
        @job.should_not be_valid
      end

      it "Without a title" do
        @job.title=nil
        @job.should_not be_valid
      end

      it "Without a city" do
        @job.city=nil
        @job.should_not be_valid
      end

      it "Without a job type specification" do
        @job.full_time=nil
        @job.part_time=nil
        @job.flexible=nil
        @job.remote=nil
        @job.should_not be_valid
      end
      it "Without a description" do
        @job.description=nil
        @job.should_not be_valid
      end
    end
    
  end
  
  def self.filter_it(filters={}, company=nil)
    results = Job.includes(:company)
      unless filters.blank?
        results = results.where(FILTERS.collect do |filter|
          %|jobs.#{filter} = 't'| if eval(filters[filter.to_sym]) 
        end.compact.join(' OR '))
	    end
	  results
  end
  
  context 'Instance methods' do
    
    describe '.filter_it' do
      context 'When filters are blank' do
        
        it 'Returns all the jobs' do
          Job.filter_it.should == (Job.all)
        end
      end
      context 'When filters are not blank' do
        pending
      end
    end
    
    describe '.at_least_one_type' do
      context 'Without any job type' do
        
        before do
          @job.update_attributes(:full_time => false, :part_time => false, :flexible => false, :remote => false)
        end
        it 'Returns false' do
          @job.at_least_one_type.should be_false
        end
      end
      
      context 'With at least a job type' do
        
        before do
          @job.update_attributes(:full_time => true)
        end
        it 'Returns true' do
          @job.at_least_one_type.should be_true
        end
      end
      
    end
    
    describe 'format_extra_skills' do
      before do
        @job.update_attributes(:extra_skill => "first,second,third")
      end
      it 'Returns the extra skill string in an CSV array' do
        @job.format_extra_skills.should eql(['first','second','third'])
      end
    end
    
  end
  
end
