class SkillCategoriesController < ApplicationController
  def index
    @skill_categories = SkillCategory.all
  end

  def show
    @skill_category = SkillCategory.find(params[:id])
  end

  def new
    @skill_category = SkillCategory.new
  end

  def create
    @skill_category = SkillCategory.new(params[:skill_category])
    if @skill_category.save
      flash[:notice] = "Successfully created skill category."
      redirect_to @skill_category
    else
      render :action => 'new'
    end
  end

  def edit
    @skill_category = SkillCategory.find(params[:id])
  end

  def update
    @skill_category = SkillCategory.find(params[:id])
    if @skill_category.update_attributes(params[:skill_category])
      flash[:notice] = "Successfully updated skill category."
      redirect_to @skill_category
    else
      render :action => 'edit'
    end
  end

  def destroy
    @skill_category = SkillCategory.find(params[:id])
    @skill_category.destroy
    flash[:notice] = "Successfully destroyed skill category."
    redirect_to skill_categories_url
  end
end
