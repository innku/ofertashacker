class CompaniesController < ApplicationController
    
  load_and_authorize_resource :except=>[:my_jobs]
  
  def index
    @companies = Company.all
  end
  
  def show    
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
    authorize! :my_jobs, current_company
    @jobs = current_company.jobs
  end
end
