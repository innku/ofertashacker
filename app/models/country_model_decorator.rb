class CountryModelDecorator < Metropoli::CountryModel
  def self.names_of_countries_with_cities
    select('countries.name').joins(:states => :cities).group('countries.name').map(&:name)
  end
end
