#= require 'application'

describe "RestrictedCityAutocomplete", ->
  beforeEach ->
    @city_input = $("<input></input>")
    @country_input = $("<input></input>")
    @widget = new RestrictedCityAutocomplete(@city_input, @country_input)

  describe 'search_term', ->
    it 'concatenates the country if a country is specified', ->
      @city_input.val('mty')
      @country_input.val('mx')
      @widget.search_term().should.equal('mty,,mx')

    it 'returns only the city if no country is specified', ->
      @city_input.val('elias')
      @widget.search_term().should.equal('elias')
