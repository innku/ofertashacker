$(document).ready(function() {

  $("#company_jobs").hide();

  $("#company_jobs_button").click(function(){
    $("#company_jobs").slideToggle("slow");
  });
  $("#new_skill_trigger").click(function() {
    $('#new_skill_trigger').remove();
    $('.new_skill').fadeIn(1500);
    });

  	//Hiding flashes after a bit
	if($('#flash_notice') != null) {
    $('#flash_notice').appendTo("#header").hide().slideDown('2000');
	setTimeout("$('#flash_notice').slideUp('500');",4000);

  }
	if($('#flash_error') != null) {
    $('#flash_error').appendTo("#header").hide().slideDown('2000');
    setTimeout("$('#flash_error').slideUp('500');",4000);
  }

	if($('#flash_alert') != null) {
    $('#flash_alert').appendTo("#header").hide().slideDown('2000');
    setTimeout("$('#flash_alert').slideUp('500');",4000);
  }
});

//check whether a collection of checkboxes are checked or not
function get_checkbox_status(selector){
    var str=[];
    $(selector).each(function(){
        if($(this).is(':checked')){
            str.push(true);
        }else{
            str.push(false);
        }
    });
    return str;
}

function check_job_types() {
    var str="";
    $("#mainMenu input").each(function() {
        if($(this).is(":checked")) {
            if(!$(this+":last")){
                str += "."+$(this).attr("id") + ","+ " ";
            } else {
                str += "."+$(this).attr("id") + " ";
            }
        }
    });
    return str;
}

var index = 0;
