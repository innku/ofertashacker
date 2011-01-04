require 'spec_helper'

describe Company do
  
  describe "#admin?" do
    it "should return true if company role is true" do
      company = Factory(:company, :role => "admin")
      company.admin?.should be_true
    end
    
    it "should return false if company role is false" do
      company = Factory(:company)
      company.admin?.should be_false
    end
  end
  
end
