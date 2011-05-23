(function($)
{
	// This script was written by Steve Fenton
	// http://www.stevefenton.co.uk/Content/Jquery-Infinite-Scroller/
	// Feel free to use this jQuery Plugin
	// Version: 3.0.0
	
	var timer;
	var filltimer;
	
	// Initialises the scroller
	var SetupInfiniteScroller = function (obj, config) {
		$(obj).html("<div id=\"" + config.innerscrollerid + "\">" + $(obj).html() + "</div>");
		$(obj).css({ width: config.width, height: config.height, overflow: config.overflow });

		FillContainerHeight(obj, config);
	};
	
	// Checks the scroll position and gets more items when required
	var FillContainerHeight = function (obj, config) {
		var containerHeight = $(obj).height();
		var height = $("#" + config.innerscrollerid).height();
		
		if (height < containerHeight) {
			GetMoreContent(obj, config);
		}
		
		filltimer = window.setTimeout(function () { FillContainerHeight(obj, config); }, 1000);
	};

	// Displays content
	var ContentReceived = function (html, obj, config) {
		if (html.length === 0) {
			$(obj).unbind("scroll");
		} else {
			$("#" + config.innerscrollerid).append(html);
		}
	};

	// Requests more content
	var GetMoreContent = function (obj, config) {
		config.modifier++;
		var nextUri = config.uri.replace(/#MODIFIER#/g, config.modifier);

		$.ajax({
			url: nextUri,
			success: function(data){
				ContentReceived(data, obj, config)
			},
			error: function (xhr, ajaxOptions, thrownError){
                    alert(xhr.status);
                    alert(thrownError);
                }
		});
	};

	$.fn.infinitescroller = function (settings) {
	
		var config = {
			innerscrollerid: "innerscroller",
			uri: "infinitefakedata.html?Page=#MODIFIER#",
			modifier: 0,
			width: "500px",
			height: "300px",
			overflow: "auto",
			offset: 50
		};
		
		if (settings) {
			$.extend(config, settings);
		}

		return this.each(function () {
		
			SetupInfiniteScroller(this, config);
			
			$(this).bind("scroll", function (event) {
				
				var containerHeight = $(this).height();
				var height = ($("#" + config.innerscrollerid).height() - containerHeight) - parseInt(config.offset);
				var scroll = $(this).scrollTop();
				
				window.clearTimeout(timer);

				if (scroll > height) {
					timer = window.setTimeout(function () { GetMoreContent(this, config); }, 500);
				}
			});			
		});
	};
})(jQuery);
