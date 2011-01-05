class JobsController < ApplicationController
  
  load_and_authorize_resource
  
  def new
    
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
end
