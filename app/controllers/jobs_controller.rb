# encoding: UTF-8
class JobsController < ApplicationController

  before_filter :new_company?, :only=>[:new]
  load_and_authorize_resource :through => :current_company, :except=>[:index, :search, :show, :my_jobs, :contact_company]
  layout :get_layout

  RANDOM = {'development' => 'RAND()', 'production' => 'random()'}[ENV['RACK_ENV']]

  def new
  end

  def create
    if @job.save
      redirect_to @job, :notice => I18n.t("notice.job.successfully_created")
    else
      render :action => "new"
    end
  end

  def index
    @jobs = Fetchers::JobFetcher.search(params)
    respond_to do |format|
      format.html {render :action => "index"}  
      format.json {render :json => @jobs }
    end
  end

  def search
    @jobs = Fetchers::JobFetcher.search(params)
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update
    params[:job][:required_skill_ids] = [] if params[:job][:required_skill_ids].nil?
    if @job.update_attributes(params[:job])
      redirect_to @job, :notice => I18n.t("notice.job.successfully_updated")
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

  def contact_company
    @job = Job.find(params[:id])
    cookies[:name] = { :value => params[:name], :expires => Time.now + 1.year }
    cookies[:email] = { :value => params[:email], :expires => Time.now + 1.year }
    ContactMailer.contact(@job, params[:name], params[:email], params[:message], params[:file]).deliver
    redirect_to(@job, :notice => "Tu mensaje fue enviado a #{@job.company.title} correctamente.")
  end

  def expire
    @job = Job.find(params[:id])
    if (@job.expire!)
      redirect_to get_redirect_to_path, :notice=> I18n.t("notice.job.successfully_expired")
    else
      redirect_to :back, :notice=> I18n.t("notice.job.not_expired")
    end
  end

  def publish
    @job = Job.find(params[:id])
    if (@job.publish!)
      redirect_to get_redirect_to_path, :notice=> I18n.t("notice.job.successfully_created")
    else
      redirect_to :back, :notice=> I18n.t("notice.job.not_published")
    end
  end

  private

  def get_layout
    (['index', 'search'].include? action_name) ? 'double_div' : 'application'
  end

  def new_company?
    if params[:new_company]
      redirect_to new_company_registration_path(:new_company => true)
    end
  end

  def get_redirect_to_path
    if request.referer.blank? || request.referer.include?('companies')
      company_path(@job.company.id)
    else
      job_path(@job)
    end
  end

end
