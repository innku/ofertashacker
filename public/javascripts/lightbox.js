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

});

