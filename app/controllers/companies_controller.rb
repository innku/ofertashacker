# encoding: UTF-8
class CompaniesController < ApplicationController
  before_filter :new_company?, :only=>[:create]
  load_and_authorize_resource
    
  def index
    @companies = Company.all(:order => "RANDOM()").select{|c| !c.blank_profile?}
  end
  
  def show
    if @company.blank_profile?
      redirect_to edit_company_path @company
      return
    end
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
  
  private

  def initial_batch?
    params[:last_date].present?
  end

  def new_company?
    if params[:new_company]
      redirect_to new_company_registration_path(:new_company => true)
    end
  end
end
