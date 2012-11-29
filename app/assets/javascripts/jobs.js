show_or_hide_input_button = function( event, ui ) {
                              if (ui.item.value == 'México' || ui.item.value == 'Estados Unidos')
                                $(this).parent().siblings('.city_info').show();
                              else
                                $(this).parent().siblings('.city_info').hide();
                            }

clean_input = function( event, ui ) {
                if (!ui.item || !ui.item.value)
                  $(this).parent().siblings('.city_info').hide();
              }

show_cities_restricted_by_country = function(request, response) {
                                        var country_name = $('.country_with_city');
                                        var search_term = request.term;                                                                                     
                                        if (country_name.length !== 0) {
                                          search_term = search_term + ',,' + country_name.val().trim();
                                        }

                                        $.ajax({
                                          url: "metropoli/cities.json",
                                          dataType: "json",
                                          data: {	q: search_term	},
                                          success: function(data) {
                                            response($.map(data, function(item) {
                                              return {
                                                label: item.city_model.to_s,
                                                value: item.city_model.to_s
                                              }
                                            }));
                                          }
                                        });
				                              }

$(document).ready(function(){
  $(".country_with_city").on("autocompleteselect", show_or_hide_input_button);
  $(".country_with_city").on("autocompletechange", clean_input);
  $(".restricted_city").autocomplete({ 
      source: show_cities_restricted_by_country
  });
});
