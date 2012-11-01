require 'spec_helper'

describe RequiredSkill do
  
  before(:each) do
    @rs=FactoryGirl.create(:required_skill)
  end

  context 'Validations' do
    context 'Required Skill is valid' do
      it "With all attributes" do
        @rs.should be_valid
      end
    end
    context 'Required Skill is not valid' do
      it "Without a skill name" do
        @rs.skill_name=nil
        @rs.should_not be_valid
      end
      it 'With a duplicated skill name' do
        FactoryGirl.create(:required_skill,:skill_name => "duplicated rs")
        @rs.update_attributes(:skill_name => "duplicated rs").should be_false
      end
    end
  end
end
