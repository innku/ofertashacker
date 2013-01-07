class window.LocationInputsApp
  constructor: (@info, @elem = $('#location_info')) ->
    @country_input = new CountryInputView(@info['country_name'], @info['city_name'], @countries_with_cities())
    
  render: ->
    @elem.prepend @country_input.render()
    @elem

  countries_with_cities: ->
    @elem.data 'countries_with_cities'

class window.CountryInputView
  constructor: (@country_name, @city_name, @countries_with_cities, @elem = $("<p></p>"),  @autocomplete_options=country_autocomplete_defaults) ->
  
  render: ->
    @elem.append(@template())
    @append_city_button_if_necessary()
    @attach_events()
    @elem
  
  append_city_button_if_necessary: ->
    if @country_has_registered_cities()
      @render_city(@city_name)

  attach_events: ->
    @country_input().autocomplete @autocomplete_options
    @country_input().on("autocompleteselect", @toggle_city)
    @country_input().on("autocompletechange", @remove_city_if_necessary)
    
  render_city: (city_name = '') ->
    @city_input_view = new RestrictedCityInputView(@country_input(), city_name)
    @elem.append(@city_input_view.render())

  toggle_city: ( event, ui ) =>
    @remove_city() if @city_input_view?
    if @country_has_registered_cities(ui.item.value)
      @render_city()
      @remove_hidden_input() if @hidden_city_input?
    else
      @render_hidden_input()

  remove_city: ->
    @city_input_view.destroy()
    @city_input_view = null

  render_hidden_input: ->
    @hidden_city_input = new HiddenCityInput()
    @elem.append(@hidden_city_input.render())

  remove_hidden_input: ->
    @hidden_city_input.destroy()
    @hidden_city_input = null

  remove_city_if_necessary: (event, ui) =>
    if (!ui.item || !ui.item.value)
      @remove_city()

  country_has_registered_cities: (country=@country_name) ->
    for registered_country in @countries_with_cities
      return true if (registered_country is country)
    false

  country_input: ->
    @elem.find('#job_country_name')

  template: ->
    """
      <label for='job_country_name'>País *</label>
      <input id='job_country_name' name="job[country_name]" type='text' value='#{@country_name}'>
    """

class RestrictedCityInputView
  constructor: (@country_input, @city_name) ->
    @elem = $('<p></p>')

  render: ->
    @elem.append(@template())
    @attach_events()
    @elem

  destroy: ->
    @elem.remove()

  attach_events: ->
    @input().autocomplete @restricted_city_params()

  restricted_city_params: ->
    new RestrictedCityAutocompleteParams(@country_input).hash()

  input: ->
    @elem.find('#job_city_name')

  template: ->
    """
      <label for='job_city_name'>Ciudad</label>
      <input id='job_city_name' name="job[city_name]" value='#{@city_name}' type='text'>
    """

class HiddenCityInput
  constructor: () ->
    @elem = $(@template())

  render: -> @elem

  destroy: -> @elem.remove()

  template: ->
    """
      <input id='hidden_city_name' name="job[city_name]" value='' type='text' style='display:none'>
    """
