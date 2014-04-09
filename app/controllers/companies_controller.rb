# encoding: UTF-8
class CompaniesController < ApplicationController
  before_filter :new_company?, :only=>[:create]
  load_and_authorize_resource :except => [:my_jobs]
  layout :get_layout
    
  def index
    @companies = Company.all(:order => "RANDOM()").select{|c| !c.blank_profile?}
  end
  
  def show
    if @company.blank_profile?
      redirect_to edit_company_path @company
      return
    end
    Innsights.report('Ver perfil compañia', group: @company).run
  end
  
  def edit
  end
  
  def update
    if @company.update_attributes(params[:company])
      redirect_to company_path, :notice => I18n.t("notice.company.successfully_updated")
    else
      render :action => 'edit'
    end
  end
  
   def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to(companies_url, :notice=>"La empresa fue eliminada correctamente") }
      format.xml  { head :ok }
    end
  end
  
  def my_jobs
    @company = current_company
    if initial_batch?
      @jobs = @company.jobs.next_jobs_batch(20, DateTime.parse(params[:last_date]))
    else
      @jobs = @company.jobs.next_jobs_batch(20)
    end
    respond_to do |format|
      format.html
      format.json {render :text => @jobs.to_json(:methods =>[:to_param], :include => {:company => {:only => [:title], :methods => [:logo_url]}}) }
    end
  end
 

  private

  def initial_batch?
    params[:last_date].present?
  end

  def get_layout
    (['my_jobs'].include? action_name) ? 'double_div' : 'application'
  end
  
  def new_company?
    if params[:new_company]
      redirect_to new_company_registration_path(:new_company => true)
    end
  end
end
