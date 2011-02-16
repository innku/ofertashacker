$(document).ready(function() {
  //jquery forms
  $("form").validator();
  
  //filtering by skills
  
  $("li.unfiltered").click(function(){
        $('li#all').removeClass('selected');
        var thisFilter = $(this).attr("id");
         $('.job').each(function() {
            if(!$(this).hasClass('rs'+thisFilter+"")){
                $(this).fadeOut();
            }
          }
        )
        $(this).addClass('selected');
  }); 
  //filtering by type
  /*  
  $("li#all").click(function(){
    $('.job').each(function() {
        $(this).fadeIn();   
    });
    $('#features li').removeClass('selected');
    $('#skill_sidebar li').removeClass('selected');
    $('li#all').addClass('selected');
  });
  */
/*
  $("#mainMenu input").click(function(){
      //$('li#all').removeClass('selected');
    var thisFilter = $(this).attr("id");
    if(!$(this).is(":checked")){
        thisFilter = check_job_types();
        $('.job').each(function() {
            if($(this).is(thisFilter) || thisFilter==""){
                $(this).fadeIn();
            }
        });
    } else {
         $('.job').each(function() {
            if(!$(this).hasClass(thisFilter)){
                $(this).fadeOut();
            }
          });              
    }
        //$(this).addClass('selected');
  });
*/
});

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
		$("#job_required_profile").append(required_skill_html);
		append_skill_id($(this).attr('data-skill-id'));
		$(this).remove();		
		index++;
	})
	
	$("li.required_skill").live('click', function(){
	    job_skill_html = job_skill_template($(this).attr('data-skill-id'), $(this).text());
		$("#job_skills").append(job_skill_html);
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
