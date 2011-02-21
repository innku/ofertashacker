class SkillCategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @skill_categories = SkillCategory.all
    @skill_category = SkillCategory.new
  end

  def show
    @skill_category = SkillCategory.find(params[:id])
    @required_skills = RequiredSkill.find_all_by_skill_category_id(@skill_category.id)
    @required_skill = RequiredSkill.new
  end

  def new
    @skill_category = SkillCategory.new
  end

  def create
    @skill_category = SkillCategory.new(params[:skill_category])
    if @skill_category.save
      flash[:notice] = "La categoría ha sido creada"
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
      flash[:notice] = "La categoría ha sido actualizada"
      redirect_to @skill_category
    else
      render :action => 'edit'
    end
  end

  def destroy
    @skill_category = SkillCategory.find(params[:id])
    @skill_category.destroy
    flash[:notice] = "La categoria ha sido borrada"
    redirect_to skill_categories_url
  end
end
