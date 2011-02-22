$(document).ready(function() {
  //jquery forms
  $("form").validator();
  
  $("#new_skill_trigger").click(function() {
    $('.new_skill').slideToggle("slow");
    $('#new_skill_trigger').fadeOut();
    });   
    
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

$(function()
{
	
	$(".skill").live('click', function(){
	    required_skill_html = required_skill_template($(this).attr('data-skill-id'), $(this).text());
	    category = $(this).parent().parent().parent().parent().attr('class');
		$("#all_skills."+category+" .profileArea .profileList #job_required_profile").append(required_skill_html);
		append_skill_id($(this).attr('data-skill-id'));
		$(this).remove();		
		index++;
	})
	
	$("li.required_skill").live('click', function(){
	    job_skill_html = job_skill_template($(this).attr('data-skill-id'), $(this).text());
	    category = $(this).parent().parent().parent().parent().attr('class');
		$("#all_skills."+category+" ul#job_skills").append(job_skill_html);
		remove_skill_id($(this).attr('data-skill-id'));
		$(this).remove();
		
	})

});

function required_skill_template(id, text){
    return "<li class='required_skill' data-skill-id='" + id + "'>" + text + "</li>";
}

function job_skill_template(id, text){
    return "<li class='skill' data-skill-id='" + id + "'>" + text + "</li>";
}

function append_skill_id(skill_id){
    if($('#job_required_skill_ids_string').val() == ''){
        $('#job_required_skill_ids_string').val(skill_id);
    }else{
        $('#job_required_skill_ids_string').val($('#job_required_skill_ids_string').val() + ',' + skill_id);
    }
}

function remove_skill_id(skill_id){
    ids = $('#job_required_skill_ids_string').val();
    ids_array = ids.split(',');
    if(ids_array.length == 1){
        $('#job_required_skill_ids_string').val('');
    }
    else if(ids_array.length > 1){
        if(ids_array[0] == skill_id)
            new_ids = ids.replace(skill_id + ',', '');
        else     
            new_ids = ids.replace(',' + skill_id, '');
        $('#job_required_skill_ids_string').val(new_ids);
    }
        
}
