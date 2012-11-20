$(document).ready(function(){
	$(".country_autocomplete").autocomplete({
		source: function(request, response) {
					$.ajax({
						url: "/metropoli/countries.json",
						dataType: "json",
						data: {	q: request.term	},
						success: function(data) {
							response($.map(data, function(item) {
								return {
									label: item.country_model.to_s,
									value: item.country_model.to_s
								}
							}));
						}
					});
				},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	})
});
