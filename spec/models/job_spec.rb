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
 
  context 'Instance methods' do
    
    describe '.filter_it' do
      context 'When filters are blank' do
        it 'Returns all the jobs' do
          Job.filter_it.should == (Job.all)
        end
      end

      context 'When filters are not blank' do
        before do
          Job.delete_all
          @full_time = Factory(:job, :full_time => true, :part_time => false, :flexible => false, :remote => false, :company => Company.last)
          @part_time = Factory(:job, :full_time => false, :part_time => true, :flexible => false, :remote => false, :company => Company.last)
          @flexible = Factory(:job, :full_time => false, :part_time => false, :flexible => true, :remote => false, :company => Company.last)
          @remote = Factory(:job, :full_time => false, :part_time => false, :flexible => false, :remote => true, :company => Company.last)
          @filters = {:full_time=>"true", :flexible=>"true", :part_time=>"true", :remote=>"true"}
        end
        
        context 'When all filters are checked' do
          it 'Returns all jobs' do
            Job.filter_it(@filters).should == (Job.all)
          end
        end
        
        context 'When full time is unchecked' do
          before do
            @filters.merge!({:full_time => "false"})
          end
          it 'Returns all jobs that does not have only full time' do
            Job.filter_it(@filters).should == ([@part_time, @flexible, @remote])
          end
        end

        context 'When part time is unchecked' do
          before do
            @filters.merge!({:part_time => "false"})
          end
          it 'Returns all jobs that does not have only part time' do
            Job.filter_it(@filters).should == ([@full_time, @flexible, @remote])
          end
          
        end
        context 'When flexible is unchecked' do
          before do
            @filters.merge!({:flexible => "false"})
          end
          it 'Returns all jobs that does not have only flexible' do
            Job.filter_it(@filters).should == ([@full_time, @part_time, @remote])
          end
          
        end
        context 'When remote is unchecked' do
          before do
            @filters.merge!({:remote => "false"})
          end
          it 'Returns all jobs that does not have only remote' do
            Job.filter_it(@filters).should == ([@full_time, @part_time, @flexible])
          end
          
        end
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
    
    describe '.formated_description' do
      before do
        @job.update_attributes(:description => "h1. Title \n Description \n\nh2. Sub Title Even more description")
      end
      
      it 'Converts h1 textile tags to h2' do
        @job.formated_description.should_not include("h1.")
      end

      it 'Converts h2 textile tags to h3' do
        @job.formated_description.should include("h2. Title")
        @job.formated_description.should include("h3. Sub Title")
        @job.formated_description.should_not include("h2. Sub Title")
      end
    end
  end
  
end
