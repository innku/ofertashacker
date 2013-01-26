class RedirecterController < ApplicationController
  def check_valid_country
    country = Metropoli::CountryModel.find_by_abbr params[:country].upcase
    if country.present?
      params[:location_id] = country.id
      params[:location_type] = 'country'
      params[:location] = country.name
      @jobs = Fetchers::JobFetcher.search(params)
      render '/jobs/search', layout: 'double_div'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
