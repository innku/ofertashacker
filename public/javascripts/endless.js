var current_page=1; //current_page for pagination

function getJobsJSON(filter_info){
    
    $.getJSON('/jobs.json',{filters: { full_time:filter_info[0],
                                       part_time:filter_info[1],
                                       flexible:filter_info[2],
                                       remote:filter_info[3],
                                       },page:current_page }, 
              function(data) {
                var i=0;
                $.each(data,function(){
                    if (is_even(i)) {
                        $(".posts.even").append(job_template(this.job)).hide().fadeIn();
                    } else {
                        $(".posts.odd").append(job_template(this.job)).hide().fadeIn(); 
                    }
                    i++;
                });   
            });
      $("#loader").html("");

}

//renders a job template 
function condensed_info(job){
    
    str = job.company.title + " en " + job.city ;
    (job.full_time) ? str+=", Tiempo completo" : "";
    (job.part_time) ? str+=", Medio tiempo" : "";
    (job.flexible) ? str+=", Flexible" : "";
    (job.remote) ? str+=", Remoto" : "";
    if (str.length<=70)
        return str;
    return str.substring(0,70) + "...";
    
}

//renders a job template 
function job_template(job) {
    var str="<li class=\"job\">";
    str += "<a href=\"/jobs/"+job.id+"\">";
    str += "<div class=\"span-4 prepend-7 last\">";
    str += "<img alt=\""+job.company.title+"\" src="+job.company.logo_url+" /></div>";
    if(job.title.length <= 40)        
        str += "<h1>" + job.title + "</h1>";
    else
        str += "<h1>" + job.title.substring(0,40) + "...</h1>"; 
    str +="<p>" + condensed_info(job) + "</p>"
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
    	$("#loader").html("<img alt=\"Loader\"src=\"/images/ajax-loader.gif\"  />");
        current_page++;
	    var filter_info = get_checkbox_status("#mainMenu input");
        getJobsJSON(filter_info);
    }
});

//checks if scroll has reached the bottom
function isScrollBottom() {
  var documentHeight = $(document).height();
  var scrollPosition = $(window).height() + $(window).scrollTop();
  return (documentHeight == scrollPosition);
} 

function countChecked(filter_info) {
    var unchecked=0;
     $.each(filter_info, function(i, value) {
        if(!value)
            unchecked++;
    });
    return unchecked;
}

$(document).ready(function() {
    $("#mainMenu input").click(function(){
        $(".posts").html("");
        $("#loader").append("<img alt=\"Loader\"src=\"/images/ajax-loader.gif\"  />");
        current_page=1;
        var filter_info = get_checkbox_status("#mainMenu input");
        if(countChecked(filter_info) == 4) {
            $("#mainMenu input").each(function() {
                $(this).attr('checked', true);
            });
        }
        getJobsJSON(filter_info);
      });
});



