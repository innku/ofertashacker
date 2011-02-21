class RequiredSkillsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def new
    @skill_categories=SkillCategory.all
  end
  
  def create
    if @required_skill.save
      redirect_to skill_category_path(@required_skill.skill_category.id), :notice => I18n.t("notice.required_skill.successfully_created")
    else
      render :action => "new"
    end
  end
  

  def destroy
    @required_skill.destroy
    respond_to do |format|
      format.html { redirect_to(skill_category_path(@required_skill.skill_category.id), :notice => I18n.t("notice.required_skill.successfully_deleted")) }
      format.xml  { head :ok }
    end
  end
  def edit
    @skill_categories=SkillCategory.all
  end
  def update
    if @required_skill.update_attributes(params[:required_skill])
      redirect_to skill_category_path(@required_skill.skill_category.id), :notice => I18n.t("notice.required_skill.successfully_updated")
    else
      render :action => "new"
    end
  end

end
