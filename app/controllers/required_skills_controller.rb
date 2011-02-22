class RequiredSkillsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def new
    @skill_categories=SkillCategory.all
  end
  
  def create
    @skill_category = SkillCategory.find(params[:skill_category_id])
    if @required_skill.save
      redirect_to skill_category_path(@skill_category), :notice => I18n.t("notice.required_skill.successfully_created")
    else
      render :action => "new"
    end
  end
  

  def destroy
    @skill_category = SkillCategory.find(params[:skill_category_id])
    @required_skill.destroy
    respond_to do |format|
      format.html { redirect_to(@skill_category, :notice => I18n.t("notice.required_skill.successfully_deleted")) }
      format.xml  { head :ok }
    end
  end
  
  def edit
    @skill_categories=SkillCategory.all
    @skill_category = SkillCategory.find(params[:skill_category_id])
  end
  
  def update
    @skill_category = SkillCategory.find(params[:skill_category_id])
    if @required_skill.update_attributes(params[:required_skill])
      redirect_to skill_category_path(@skill_category), :notice => I18n.t("notice.required_skill.successfully_updated")
    else
      render :action => "new"
    end
  end

end
