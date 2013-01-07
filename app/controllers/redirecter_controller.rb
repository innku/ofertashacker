class RedirecterController < ApplicationController
  def check_valid_country
    country = Metropoli::CountryModel.find_by_abbr params[:country].upcase
    if country.present?
      redirect_to job_search_path(:location_id => country.id, :location_type => 'country', :location => country.name)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
