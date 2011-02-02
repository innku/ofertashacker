require 'spec_helper'

describe RequiredSkill do
  
  before(:each) do
    @rs=RequiredSkill.new(
      :skill_name => "Rails", 
      :skill_category_id => "1"
    )
  end

  it "is valid with valid attributes" do
    @rs.should be_valid
  end

  it "is not valid without skill_name" do
    @rs.skill_name=nil
    @rs.should_not be_valid
  end

  it "is not valid without a skill_category_id" do
    @rs.skill_category_id=nil
    @rs.should_not be_valid
  end

end
