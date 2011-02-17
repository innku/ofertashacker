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
    if current_company
      @jobs = current_company.jobs.search(params[:search],params[:type])
    else
      @jobs = Job.search(params[:search],params[:type])
    end
    if params[:filter]
      @jobs=Job.filter_it(
            params[:full_time],
            params[:part_time],
            params[:flexible],
            params[:remote])      
    end
    @jobs=@jobs.paginate :page => params[:page], :per_page => 6
    respond_to do |format|
      format.html {render :action => "index"}  
      format.json {render :text => @jobs.to_json}
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
