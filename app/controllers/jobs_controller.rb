class JobsController < ApplicationController

 load_and_authorize_resource :through => :current_company, :except=>[:index,:show]

  
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
    @jobs =  Job.filter_it(params[:filters])
    @jobs &= Job.where(:company_id => current_company.id) if current_company
    @jobs = @jobs.ordered.paginate :page => params[:page], :per_page => 8
    respond_to do |format|
      format.html {render :action => "index"}  
      format.json {render :text => @jobs.to_json(:include => {:company => {:only => [:title], :methods => [:logo_url]}}) }
    end
  end
  
  def show
    @job=Job.find(params[:id])
  end
  
  def edit

  end
  
  def update
    if @job.update_attributes(params[:job])
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
