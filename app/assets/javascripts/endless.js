var last_date;
var can_send = true;
function getJobsJSON(filter_info,apply_filter){
  spinner = new SpinnerApp($('#content'));

  $.ajax({
    url: get_json_path(), 
    dataType: 'json',
    data: { 
      filters: { 
        full_time:filter_info[0],
        part_time:filter_info[1],
        flexible:filter_info[2],
        remote:filter_info[3]
      }, 
      last_date:last_date, 
      location_id: $.hiddenParam('old_location_id'), 
      location_type: $.hiddenParam('old_location_type'),
      keywords: $.hiddenParam('old_keywords')
    }, 
    beforeSend: function() { if (!apply_filter) { spinner.rise() } },
    complete:   function() { spinner.hide() },
    success: function(data) {
      if(apply_filter){
        $(".posts").children(".job").each(function(){
          $(this).slideUp({complete:function(){$(this).remove();}});
        });
      }
      var i=0;
      $.each(data,function(){
        if (is_even(i)) {
          $(".posts.even").append(job_template(this.job));
        } else {
          $(".posts.odd").append(job_template(this.job)); 
        }
        i++;
      });
      if(apply_filter) {
        setTimeout(function() { 
          new NoJobAppender($('#skill_main'), data.length).toggle();
        }, 500);
      } else {
        can_send = true;
      }
      $("#loader img").animate({opacity:'hide'});
    }
  });
}
function get_last_date(){
  var even_size = $(".posts.even").children(".job").length
  var odd_size = $(".posts.odd").children(".job").length
  if(even_size == odd_size) {
    last_job = $(".posts.odd").children(".job")[odd_size - 1]
  } else {
    last_job = $(".posts.even").children(".job")[even_size - 1]
  }
  return $(last_job).find("input[name='publish_date']").val()
}
function get_json_path(){
  if($("#endless_path").val()=="my_jobs") 
    return ("/companies/"+ $("#endless_path").attr("company") +"/my_jobs.json");
  return "/jobs.json"
}
//renders a job template 
function condensed_info(job){
  str = job.company.title + " en " + job.origin ;
  (job.full_time) ? str+=", Tiempo completo" : "";
  (job.part_time) ? str+=", Medio tiempo" : "";
  (job.flexible) ? str+=", Flexible" : "";
  (job.remote) ? str+=", Remoto" : "";
  if (str.length<= 70)
    return str;
  return str.substring(0,70) + "...";

}

//renders a job template 
function job_template(job) {
  var str="<li class=\"job shadow\"" + " id=\"" + job.id +"\" >";
  str += "<input type='hidden' name='publish_date' value=" + job.publish_date + ">";
  str += "<a href=\"/jobs/"+job.to_param +"\">";
  str += "<div class=\"span-4\">";
  if(job.has_logo)
    str += "<img alt=\""+job.company.title+"\" src=\""+job.logo_url+"\" />";
  else
    if(job.company.title.length <= 25)
      str += "<h4>" + job.company.title + "</h4>";
    else
      str += "<h4>" + job.company.title.substring(0,22) + "...</h4>";
  str += "</div>";
  str += "<div class='prepend-3 span-5 last'>";
  str += "<span class='small-tag'>Hace " + job.formatted_publish_date + "</span>";
  str += "</div>"
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

//checks if scroll has reached the bottom
function isScrollBottom() {
  var documentHeight = $(document).height();
  var scrollPosition = $(window).height() + $(window).scrollTop();
  return (documentHeight <= (300 + scrollPosition));
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
  last_date = (get_last_date());

  $("#mainMenu input").click(function(){
    $("#loader").remove();
    $("#header").append("<div id=\"loader\"><img alt=\"Loader\"src=\"/assets/ajax-loader.gif\"  /></div>");
    $("#loader").hide().fadeIn();

    var filter_info = get_checkbox_status("#mainMenu input");
    if(countChecked(filter_info) == 4) {
      $("#mainMenu input").each(function() {
        $(this).attr('checked', true);
      });
    }
    last_date = null;
    getJobsJSON(filter_info,true);

    $("#loader").fadeOut();

  });

  if ($('.endless_content').length != 0) { 
    //renders new jobs when scroll reaches the bottom
    $(window).scroll(function(){
      var i=0;
      if(isScrollBottom() && can_send){
        can_send = false;
        last_date = (get_last_date());
        var filter_info = get_checkbox_status("#mainMenu input");
        getJobsJSON(filter_info,false) 
      }
    });
  }

});

