class CountryModelDecorator < Metropoli::CountryModel
  def self.names_of_countries_with_cities
    uniq.joins(:states => :cities).pluck('countries.name')
  end

  def self.abbr_of_countries_with_cities
    uniq.joins(:states => :cities).pluck('countries.abbr')
  end
end
