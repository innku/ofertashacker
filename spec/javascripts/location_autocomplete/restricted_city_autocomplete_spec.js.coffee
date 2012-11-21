#= require 'application'

describe "RestrictedCityAutocompleteParams", ->
  beforeEach ->
    @country_input = $("<input></input>")
    @widget = new RestrictedCityAutocompleteParams(@country_input)

  describe 'search_term', ->
    it 'concatenates the country if a country is specified', ->
      @country_input.val('mx')
      request =
        term: 'mty'
      @widget.search_term(request).should.equal('mty,,mx')

    it 'returns only the city if no country is specified', ->
      request =
        term: 'elias'
      @widget.search_term(request).should.equal('elias')
