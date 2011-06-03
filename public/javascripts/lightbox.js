$(document).ready(function() {
  $("a[rel]").overlay();
  $("#sign_in").hide();
  // $("#contact_button").click();
  $("#registration #login").click(function(){
     $("#registration").fadeOut({complete:function(){$("#sign_in").fadeIn();}});
  });
  $("#sign_in #register").click(function(){
     $("#sign_in").fadeOut({complete:function(){$("#registration").fadeIn();}});
  });
});

