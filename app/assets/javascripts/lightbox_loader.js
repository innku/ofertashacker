$(document).ready(function() {

  $("a[rel]").overlay({
    mask: {
      color: '#333',
      loadSpeed: 150,
      opacity: 0.9
    },
    closeOnClick: false
  });

  $(".overlay.contact form").validate();
  $("#contact_submit").click(function(){
    $("#form_loader").fadeOut();
  });
  $("#loader_contact").hide();
  $(".contact.overlay form").submit(function(){
    setTimeout(function() {
      if(!$("label.error").is(":visible"))
        $("#loader_contact").fadeIn();
    }, 200);
  });

});

