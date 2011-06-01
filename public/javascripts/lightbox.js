$(document).ready(function() {
  $("a[rel]").overlay();
  $("#sign_in").hide();
  $("#registration #login").click(function(){
     $("#registration").fadeOut({complete:function(){$("#sign_in").fadeIn();}});
  });
});

