class JobsController < ApplicationController
  before_filter :new_company?, :only=>[:new]
  load_and_authorize_resource :through => :current_company, :except=>[:index,:show,:my_jobs]
  layout :get_layout

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
    @jobs =  Job.filter_it(params[:filters], current_company).ordered
    @jobs = @jobs.paginate :page => params[:page], :per_page => 8
    respond_to do |format|
      format.html {render :action => "index"}  
      format.json {render :text => @jobs.to_json(:include => {:company => {:only => [:title], :methods => [:logo_url]}}) }
    end
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def edit
  end

  
  def update
    params[:job][:required_skill_ids] = [] if params[:job][:required_skill_ids].nil?
    if @job.update_attributes(params[:job])
      redirect_to jobs_path, :notice => I18n.t("notice.job.successfully_updated")
    else
      render :action => "new"
    end
  end
  
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to(jobs_url, :notice=>"La oferta fue eliminada correctamente") }
      format.xml  { head :ok }
    end
  end

  private

  def get_layout
    (['index'].include? action_name) ? 'double_div' : 'application'
  end

  def new_company?
    if params[:new_company]
      redirect_to new_company_registration_path(:new_company => true)
    end
  end

end
