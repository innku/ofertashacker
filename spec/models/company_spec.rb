require 'spec_helper'

describe Company do
  
  before(:each) do
    @company=Company.new(
      :title => "foo", 
      :city => "Nuevo Leon",
      :description => "Hola",
      :email => "rog@example.com",      
      :password => "secret",
      :password_confirmation => "secret"
      )
  end

  it "is valid with valid attributes" do
    @company.should be_valid
  end

  it "is not valid without title" do
    @company.title=nil
    @company.should_not be_valid
  end

  it "is not valid without a city" do
    @company.city=nil
    @company.should_not be_valid
  end

  it "is not valid without a description" do
    @company.description=nil
    @company.should_not be_valid
  end

end
