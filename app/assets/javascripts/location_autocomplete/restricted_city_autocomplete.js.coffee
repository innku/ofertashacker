class window.RestrictedCityAutocomplete
  constructor: (@city_input, @country_input) ->
    @attach_autocomplete_to_city()

  attach_autocomplete_to_city: ->
    @city_input.autocomplete
      source: @city_search

  city_search: (request, response) =>
    $.ajax
      url: "metropoli/cities.json"
      dataType: "json"
      data:
        q: @search_term
      success: (data) ->
        response $.map(data, (item) ->
          label: item.city_model.to_s
          value: item.city_model.to_s
        )

  search_term: () =>
    term = @city_input.val()
    country_name = @country_input.val()
    if (country_name.length isnt 0)
      term = term + ',,' + country_name.trim()
    term
