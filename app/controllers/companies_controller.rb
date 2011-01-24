class CompaniesController < ApplicationController
    
  load_and_authorize_resource
  
  def index
    @companies = Company.all
    #if current_company && current_company.admin?
     # @companies = Company.members
    #end
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
end
