var current_page=1; //current_page for pagination

//renders a job template 
function job_template(job) {
    var str="<li class=\"job\">";
    str += "<a href=\"/jobs/"+job.id+"\">";
    str += "<div class=\"span-4 prepend-8 last\"></div>";
    str += "<h1>" + job.title + "</h1>";            
    str += "</a></li>";
    return str;
}
//checks if number is even
function is_even(num){
    return num%2==0
}
//renders new jobs when scroll reaches the bottom
$(window).scroll(function(){
    var i=0;
    if(isScrollBottom()){
        current_page++;
        $.getJSON('/jobs.json',{page:current_page}, function(data) {
            $.each(data,function(){
                if (is_even(i)) {
                    $(".posts.even").append(job_template(this.job));
                } else {
                    $(".posts.odd").append(job_template(this.job)); 
                }
                i++;
            });
        });
    }
});

//checks if scroll has reached the bottom
function isScrollBottom() {
  var documentHeight = $(document).height();
  var scrollPosition = $(window).height() + $(window).scrollTop();
  return (documentHeight == scrollPosition);
} 
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

  $("#mainMenu input").click(function(){
    var filter_info = get_checkbox_status("#mainMenu input");
     $(".posts").html("");
     $.getJSON('/jobs.json',{filter:'true',
                            full_time:filter_info[0],
                            part_time:filter_info[1],
                            remote:filter_info[2],
                            flexible:filter_info[3]}, function(data) {
            var i=0;
            $.each(data,function(){
                if (is_even(i)) {
                    $(".posts.even").append(job_template(this.job));
                } else {
                    $(".posts.odd").append(job_template(this.job)); 
                }
                i++;
            });
    });
    
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
