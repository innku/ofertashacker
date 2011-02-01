require 'spec_helper'

describe Job do

  before(:each) do
    @job=Job.new(
      :title => "foo", 
      :company_id => "1",
      :city => "Monterrey",
      :description => "Hola",
      :full_time=> true,
      :part_time=> false,
      :remote=> true,
      :flexible=> true
      
      )
  end

  it "is valid with valid attributes" do
    @job.should be_valid
  end

  it "is not valid without company_id" do
    @job.company_id=nil
    @job.should_not be_valid
  end

  it "is not valid without a title" do
    @job.title=nil
    @job.should_not be_valid
  end

  it "is not valid without city" do
    @job.city=nil
    @job.should_not be_valid
  end

  it "is not valid without a a full_time/part_time especification" do
    @job.full_time=nil
    @job.part_time=nil
    @job.should_not be_valid
  end
  it "is not valid without a description" do
    @job.description=nil
    @job.should_not be_valid
  end

end
