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
  
  $("#sign_in").hide();

  if ($("#sign_me_in").length > 0) {
    $(".overlay.contact").animate({'width':'380px', 'height': '290px','marginLeft':'200px'});
    $("#registration").hide();
    $("#sign_in").show();
  }
  if ($("#open_me").length > 0)
    $("#contact_button").click();

  $("#registration #login").click(function(){
    $(".overlay.contact").animate({'width':'380px', 'height': '290px','marginLeft':'200px'});
    $("#registration").fadeOut({complete:function(){$("#sign_in").fadeIn();}});

  });

  $("#sign_in #register").click(function(){
    $(".overlay.contact").animate({'width':'780px', 'height':'460px','marginLeft':'0'});
    $("#sign_in").hide({complete:function(){$("#registration").fadeIn();}});
  });


});

