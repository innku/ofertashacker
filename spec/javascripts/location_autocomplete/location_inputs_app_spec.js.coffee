#= require 'application'

describe 'LocationInputsApp', ->
  beforeEach ->
    location_info =
      city_name: 'Monterrey'
      country_name: 'Mexico'
    @elem = $("""
      <div data-countries_with_cities='["Mexico", "United States"]'>
      </div>
    """)
    @app = new LocationInputsApp(location_info, @elem)

  describe 'at initialization', ->
    it 'creates an autocomplete country input if no values are supplied', ->
      info =
        city_name: ''
        country_name: ''
      app = new LocationInputsApp(info, @elem)
      app.render().find("input").hasClass('ui-autocomplete-input').should.equal(true)
    
    it 'creates an autocomplete country input with the country value if the country doesnt have registered cities', ->
      info =
        city_name: ''
        country_name: 'Elias'
      app = new LocationInputsApp(info, @elem)
      app.render().find("input").val().should.equal('Elias')
    
    it 'creates an autocomplete country input and an autocomplete city if the country has registered cities', ->
      info =
        city_name: ''
        country_name: 'Mexico'
      app = new LocationInputsApp(info, @elem)
      html = app.render()
      html.find("input.ui-autocomplete-input").length.should.equal(2)

    it 'creates an autocomplete country input and an autocomplete city with the city is supplied if the country has registered cities', ->
      info =
        country_name: 'Mexico'
        city_name: 'Mty'
      app = new LocationInputsApp(info, @elem)
      html = app.render()
      html.find("#job_country_name").val().should.equal('Mexico')
      html.find("#job_city_name").val().should.equal('Mty')

describe 'CountryInputView', ->
  beforeEach ->
    @country_elem = $('<div></div>')
    @autocomplete_attributes = { source: ['Mexico', 'Venezuela'], appendTo: @country_elem } 
    @countries_with_cities = ['Mexico', 'United States']

  describe 'when someone selects a country', ->
    it 'creates the city input if the country has registered citites', ->
      app = new CountryInputView('', '', @countries_with_cities, @country_elem, @autocomplete_attributes)
      html = app.render()
      html.find("#job_country_name").autocomplete('search', 'M')
      html.find('.ui-menu-item a:contains("Mexico")').trigger("mouseenter").click()
      html.find("input.ui-autocomplete-input").length.should.equal(2)
    
    it 'removes the hidden input if the country has registered cities and a hidden city input existed', ->
      app = new CountryInputView('', '', @countries_with_cities, @country_elem, @autocomplete_attributes )
      html = app.render()
      html.find("#job_country_name").autocomplete('search', 'V')
      html.find('.ui-menu-item a:contains("Venezuela")').trigger("mouseenter").click()
      html.find("#job_country_name").autocomplete('search', 'M')
      html.find('.ui-menu-item a:contains("Mexico")').trigger("mouseenter").click()
      html.find("input#hidden_city_name").length.should.equal(0)

    it 'removes the city and creates a hidden input if the country has no registered cities', ->
      app = new CountryInputView('Mexico', '', @countries_with_cities, @country_elem, @autocomplete_attributes)
      html = app.render()
      html.find("#job_country_name").autocomplete('search', 'Venezuela')
      html.find('.ui-menu-item a:contains("Venezuela")').trigger("mouseenter").click()
      html.find("input.ui-autocomplete-input").length.should.equal(1)
      html.find("input#hidden_city_name").val().should.equal('')
  
    it 'removes the hidden city if a hidden city exists', ->
      app = new CountryInputView('Mexico', '', @countries_with_cities, @country_elem, @autocomplete_attributes)
      html = app.render()
      html.find("#job_country_name").autocomplete('search', 'Venezuela')
      html.find('.ui-menu-item a:contains("Venezuela")').trigger("mouseenter").click()
      html.find("input.ui-autocomplete-input").length.should.equal(1)

  describe 'when someone changes the country value', ->
    it 'deletes the city input', ->
      app = new CountryInputView('Mexico', '', @countries_with_cities, @country_elem, @autocomplete_attributes)
      html = app.render()
      html.find("#job_country_name").data("autocomplete")._trigger("change")
      html.find("input.ui-autocomplete-input").length.should.equal(1)
