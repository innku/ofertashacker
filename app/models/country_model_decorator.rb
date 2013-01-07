class CountryModelDecorator < Metropoli::CountryModel
  scope :with_cities, joins(:states => :cities).group('countries.name')

  def self.extract_names
    scoped.map(&:name)
  end
end
