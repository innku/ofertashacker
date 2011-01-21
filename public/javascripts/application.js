var index = 0;

$(function(){
	
	$(".skill").live('click', function(){
		var skill = $(this).text();
		$("#job_required_profile").append("<li class='required_skill'>"+skill+"<input id='job_required_skills_attributes_"+index+"_skill_name' type='hidden' value="+skill+" name='job[required_skills_attributes]["+index+"][skill_name]'></li>");
		$(this).remove();		
		index++;
	})
	
	$("li.required_skill").live('click', function(){
		var skill = $(this).text();
		$("#job_skills").append("<li class='skill'>"+skill+"</li>")
		$(this).remove();
	})
});
