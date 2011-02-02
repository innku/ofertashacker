require 'spec_helper'

describe SkillCategory do
  
  before(:each) do
    @sc=SkillCategory.new(
      :category => "Back End"
    )
  end

  it "is valid with valid attributes" do
    @sc.should be_valid
  end

  it "is not valid without category" do
    @sc.category=nil
    @sc.should_not be_valid
  end

end
