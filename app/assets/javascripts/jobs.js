show_or_hide_input_button = function( event, ui ) {
                              if (ui.item.value == 'Mexico' || ui.item.value == 'United States')
                                $(this).parent().siblings('.city_info').show();
                              else
                                $(this).parent().siblings('.city_info').hide();
                            }

clean_input = function( event, ui ) {
                if (!ui.item || !ui.item.value)
                  $(this).parent().siblings('.city_info').hide();
              }
$(document).ready(function(){
  $(".country_with_city").on("autocompleteselect", show_or_hide_input_button);
  $(".country_with_city").on("autocompletechange", clean_input);

  new RestrictedCityAutocomplete(
    $(".restricted_city.city_autocomplete"), 
    $('.country_with_city')
  );
});
