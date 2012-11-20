$(document).ready(function(){
  $(function(){
    $('.full_autocomplete').FullAutocomplete({
      source : function(request, response) {
                 $.ajax({
                   url: "metropoli/cities_and_countries.json",
                   dataType: "json",
                   data: {	q: request.term	},
                   success: function(data) {
                     cities = $.map( data['cities'], function( item ) {
                       return { label: item.city_model.to_s, value: item.city_model.to_s, category: 'Ciudades', type: 'city', id: item.city_model.id }
                     });
                     countries = $.map( data['countries'], function( item ) {
                       return { label: item.country_model.to_s, value: item.country_model.to_s, category: 'Países', type: 'country', id: item.country_model.id }
                     });
                     
                     response(cities.concat(countries));
                   }
                 });
              },
      select: function(event, ui){
                var form = $(this).closest('form');
                form.find('input[id$=location_id]').val(ui.item.id);
                form.find('input[id$=location_type]').val(ui.item.type);
              },
      open : function() {
                var form = $(this).closest('form');
                form.find('input[id$=location_id]').val('');
                form.find('input[id$=location_type]').val('');
              }
    });
  });

  $.widget( "custom.FullAutocomplete", $.ui.autocomplete, {
    _renderMenu: function( ul, items ) {
      var self = this,
      currentCategory = "";

      $.each( items, function( index, item ) {
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        self._renderItem(ul, item);
      });
    },
    _renderItem: function( ul, item ) {
		  return $( "<li></li>" )
			  .data( "item.autocomplete", item )
			  .append( "<a id='" + item.type + "_" + item.id + "'>" + item.value + "</a>" )
			  .appendTo( ul );
	  }
  });
});
