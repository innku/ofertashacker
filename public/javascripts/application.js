
var index = 0;
 $(document).ready(function() {
  $("form").validator();
  $("li#full_time").click(function(){
    $('.job').fadeOut();
    $('.job.full_time').fadeIn();
    $('.job.full_time').each().addClass('selected');
    $('li#full_time').addClass('selected');
  });
  $("li#part_time").click(function(){
    $('.job').fadeOut();
    $('.job.part_time').fadeIn();
    $('li#part_time').addClass('selected');
  });
  $("li#remote").click(function(){
    $('.job').fadeOut();
    $('.job.remote').fadeIn();
    $('li#remote').addClass('selected');

  });
  $("li#flexible").click(function(){
    $('.job').fadeOut();
    $('.job.flexible').fadeIn();
    $('li#flexible').addClass('selected');
  });

 });

$(function(){
	
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
