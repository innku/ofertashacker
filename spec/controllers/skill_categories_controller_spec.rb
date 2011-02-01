require File.dirname(__FILE__) + '/../spec_helper'

describe SkillCategoriesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => SkillCategory.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    SkillCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    SkillCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(skill_category_url(assigns[:skill_category]))
  end

  it "edit action should render edit template" do
    get :edit, :id => SkillCategory.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    SkillCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SkillCategory.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    SkillCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SkillCategory.first
    response.should redirect_to(skill_category_url(assigns[:skill_category]))
  end

  it "destroy action should destroy model and redirect to index action" do
    skill_category = SkillCategory.first
    delete :destroy, :id => skill_category
    response.should redirect_to(skill_categories_url)
    SkillCategory.exists?(skill_category.id).should be_false
  end
end
