class window.RestrictedCityAutocompleteParams
  constructor: (@country_input) ->

  hash: ->
    source: @city_search

  city_search: (request, response) =>
    $.ajax
      url: "/metropoli/cities.json"
      dataType: "json"
      data:
        q: @search_term(request)
      success: (data) ->
        response $.map(data, (item) ->
          label: item.city_model.to_s
          value: item.city_model.to_s
        )

  search_term: (request) =>
    term = request.term
    country_name = @country_input.val()

    if (country_name.length isnt 0)
      term = term + ',,' + country_name.trim()
    term
