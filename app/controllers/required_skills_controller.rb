class RequiredSkillsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @required_skills = RequiredSkill.paginate :page => params[:page], :per_page => 10
    @required_skill = RequiredSkill.new
  end

  def new
  end
  
  def create
    if @required_skill.save
      redirect_to required_skills_path, 
                  :notice => I18n.t("notice.required_skill.successfully_created")
    else
      render :action => "new"
    end
  end
  
  def update
    if @required_skill.update_attributes(params[:required_skill])
      redirect_to required_skills_path, 
                  :notice => I18n.t("notice.required_skill.successfully_updated")
    else
      render :action => "new"
    end
  end

  def destroy
    @required_skill.destroy
    respond_to do |format|
      format.html { redirect_to required_skills_path, 
                    :notice => I18n.t("notice.required_skill.successfully_deleted") }
      format.xml  { head :ok }
    end
  end
  
  def edit
  end

end
