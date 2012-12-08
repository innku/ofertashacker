$(document).ready ->
  $ ->
    $(".full_autocomplete").FullAutocomplete
      minLength: 0

      source: (request, response) ->
        $.ajax
          url: "metropoli/cities_and_countries.json"
          dataType: "json"
          data:
            q: request.term

          success: (data) ->
            cities = $.map(data["cities"], (item) ->
              label: item.city_model.to_s
              value: item.city_model.to_s
              category: "Ciudades"
              type: "city"
              id: item.city_model.id
            )
            countries = $.map(data["countries"], (item) ->
              label: item.country_model.to_s
              value: item.country_model.to_s
              category: "Países"
              type: "country"
              id: item.country_model.id
            )
            response cities.concat(countries)

      select: (event, ui) ->
        form = $(this).closest("form")
        form.find("input[id$=location_id]").val ui.item.id
        form.find("input[id$=location_type]").val ui.item.type

      search: ->
        form = $(this).closest("form")
        form.find("input[id$=location_id]").val ""
        form.find("input[id$=location_type]").val ""

  # Monkey patches render menu to split into categories
  $.widget "custom.FullAutocomplete", $.ui.autocomplete,
    _renderMenu: (ul, items) ->
      self = this
      currentCategory = ""
      $.each items, (index, item) ->
        unless item.category is currentCategory
          ul.append "<li class='ui-autocomplete-category'>" + item.category + "</li>"
          currentCategory = item.category
        self._renderItem ul, item

    _renderItem: (ul, item) ->
      $("<li></li>").
        data("item.autocomplete", item).
        append("<a>" + item.value + "</a>").
        appendTo ul
