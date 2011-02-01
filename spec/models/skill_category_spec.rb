require File.dirname(__FILE__) + '/../spec_helper'

describe SkillCategory do
  it "should be valid" do
    SkillCategory.new.should be_valid
  end
end
