class JobsController < ApplicationController

 load_and_authorize_resource :through => :current_company

  
  def new

    @job.required_skills.build
  end
  
  def create
    if @job.save
      redirect_to jobs_path, :notice => I18n.t("notice.job.successfully_created")
    else
      render :action => "new"
    end
  end
  
  def index
    @jobs = current_company.jobs
  end
  
  def show
  end
  
  def edit
  end
  def update
    if @job.save
      redirect_to jobs_path, :notice => I18n.t("notice.job.successfully_updated")
    else
      render :action => "new"
    end
  end
  
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to(jobs_url, :notice=>"La vacante fue eliminada correctamente") }
      format.xml  { head :ok }
    end
  end
end
