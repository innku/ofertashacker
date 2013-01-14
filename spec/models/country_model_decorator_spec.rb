require 'spec_helper'

describe 'CountryModelDecorator' do
  describe 'names_of_countries_with_cities' do
    it 'returns the country name of only the countries with registered cities' do
      country = FactoryGirl.create :country, name: 'Mexico'
      state = FactoryGirl.create :state, country: country
      city = FactoryGirl.create :city, state: state
      country_with_no_cities = FactoryGirl.create :country, name: 'Venezuela'
      CountryModelDecorator.names_of_countries_with_cities.should == ['Mexico']
    end
  end
end
