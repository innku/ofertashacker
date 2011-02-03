(function($){

// Shuffle function from: http://james.padolsey.com/javascript/shuffling-the-dom/
    
$.fn.shuffle = function() {

        var allElems = this.get(),
            getRandom = function(max) {
                return Math.floor(Math.random() * max);
            },
            shuffled = $.map(allElems, function(){
                var random = getRandom(allElems.length),
                    randEl = $(allElems[random]).clone(true)[0];
                allElems.splice(random, 1);
                return randEl;
            });
        
        this.each(function(i){
            $(this).replaceWith($(shuffled[i]));
        });
        
        return $(shuffled);
    };
})(jQuery);
   
$(function(){
	       
   $(".discounted-item")
        .css("opacity","0.8")
       .hover(function(){
           $(this).css("opacity","1");
       }, function() {
           $(this).css("opacity","0.8");
       })
       /*.click(function(){
           location.href = $(this).attr("rel"); 
           return false;
       }) 
       
       UNCOMMENT THIS TO MAKE THE BLOCKS CLICKABLE TO THEIR REL ATTRIBUTES
       
       */;
       
   $("#all").click(function(){
       $(".discounted-item").slideDown();
       $("#picker a").removeClass("current");
       $(this).addClass("current");
       return false;
   });
   
   $(".filter").click(function(){
        var thisFilter = $(this).attr("id");
        $(".discounted-item").slideUp();
        $("."+ thisFilter).slideDown();
        $("#picker a").removeClass("current");
        $(this).addClass("current");
        return false;
   });
   
   $(".discounted-item").shuffle();

});



var index = 0;
 $(document).ready(function() {
  $("form").validator();
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
