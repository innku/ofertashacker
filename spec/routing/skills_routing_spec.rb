require "spec_helper"

describe SkillsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/skills" }.should route_to(:controller => "skills", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/skills/new" }.should route_to(:controller => "skills", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/skills/1" }.should route_to(:controller => "skills", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/skills/1/edit" }.should route_to(:controller => "skills", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/skills" }.should route_to(:controller => "skills", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/skills/1" }.should route_to(:controller => "skills", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/skills/1" }.should route_to(:controller => "skills", :action => "destroy", :id => "1")
    end

  end
end
