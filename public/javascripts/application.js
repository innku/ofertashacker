$(document).ready(function() {
  $("#company_jobs").hide();
  $("#company_jobs_button").click(function(){
    $("#company_jobs").slideToggle("slow");
  });
  $("#new_skill_trigger").click(function() {
    $('.new_skill').slideToggle("slow");
    $('#new_skill_trigger').fadeOut();
    });

  	//Hiding flashes after a bit
	if($('#flash_notice') != null) {
    $('#flash_notice').hide().slideDown();
		setTimeout("$('#flash_notice').hide('blind',{},500);",4000);
  }
	if($('#flash_error') != null)
    $('#flash_error').hide().slideDown();
		setTimeout("$('#flash_error').hide('blind',{},500);",4000);
	if($('#flash_alert') != null)
    $('#flash_alert').hide().slideDown();
		setTimeout("$('#flash_alert').hide('blind',{},500);",4000);
    
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
