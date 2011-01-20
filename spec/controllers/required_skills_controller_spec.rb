require 'spec_helper'

describe RequiredSkillsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
    end
  end
  #TODO fix this test
  
  #describe "DELETE 'destroy'" do
  #  it "should be successful" do
  #    get 'destroy'
  #    response.should be_success
  #  end
  #end

end
