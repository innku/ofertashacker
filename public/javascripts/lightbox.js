$(document).ready(function() {

  $("a[rel]").overlay({
    mask: {
      color: '#333',
      loadSpeed: 150,
      opacity: 0.9
    },
    closeOnClick: false
  });
  var root = $("#wizard").scrollable();
  $("#registration form").validator();

  $(".overlay #user_submit").click(function(e){
      if($("label.message").length > 0) {
        $('.button.prev').click();
      }
  });
  $(':text:first').focus();  
  
  $("#sign_in").hide();

  //No user logged in
  if ($("#sign_me_in").length > 0) {
    $(".overlay.contact").animate({'width':'380px', 'height': '270px','marginLeft':'200px'});
    $("#registration").hide();
    $("#sign_in").show();
  }
  if ($("#open_me").length > 0)
    $("#contact_button").click();

  $("#registration #login").click(function(){
    $(".overlay.contact").animate({'width':'380px', 'height': '270px','marginLeft':'200px'});
    $("#registration").fadeOut({complete:function(){$("#sign_in").fadeIn();}});

  });
  
  $("#sign_in #register").click(function(){
    $(".overlay.contact").animate({'width':'780px', 'height':'425px','marginLeft':'0'});
    $("#sign_in").hide({complete:function(){$("#registration").fadeIn();}});
  });

  //User logged in
  $("#edit_form").hide();


  if ($("#edit_me").length > 0) {
    $("#message_form").hide();
    $("#edit_form").show();
  }

  $("#message_form #edit_link").click(function(){
    $("#message_form").fadeOut({complete:function(){$("#edit_form").fadeIn();}});
  });

  $("#edit_form #message_link").click(function(){
    $("#edit_form").fadeOut({complete:function(){$("#message_form").fadeIn();}});
  });


  //Tab Hack for form
  root.find(".button.next").keydown(function(e) {
    if (e.keyCode == 9) {
      // seeks to next tab by executing our validation routine
      api.next();
      e.preventDefault();
    }
  });


// some variables that we need
var api = root.scrollable(), drawer = $("#drawer");

// validation logic is done inside the onBeforeSeek callback
api.onBeforeSeek(function(event, i) {

	// we are going 1 step backwards so no need for validation
	if (api.getIndex() < i) {

		// 1. get current page
		var page = root.find(".page").eq(api.getIndex()),

			 // 2. .. and all required fields inside the page
			 inputs = page.find(".required :input").removeClass("error"),

			 // 3. .. which are empty
			 empty = inputs.filter(function() {
				return $(this).val().replace(/\s*/g, '') == '';
			 });

		 // if there are empty fields, then
		if (empty.length) {

			// slide down the drawer
			drawer.slideDown(function()  {

				// colored flash effect
				drawer.css("backgroundColor", "#229");
				setTimeout(function() { drawer.css("backgroundColor", "#fff"); }, 1000);
			});

			// add a CSS class name "error" for empty & required fields
			empty.addClass("error");

			// cancel seeking of the scrollable by returning false
			return false;

		// everything is good
		} else {

			// hide the drawer
			drawer.slideUp();
		}

	}

	// update status bar
	$("#status li").removeClass("active").eq(i).addClass("active");

});

});

