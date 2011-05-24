var current_page=1; //current_page for pagination
var changes;
var can_send = true;
function getJobsJSON(filter_info,remove){
  $.getJSON(get_json_path(),{filters: { full_time:filter_info[0],
            part_time:filter_info[1],
            flexible:filter_info[2],
            remote:filter_info[3],
  },page:current_page }, 
  function(data) {
    changes = false;
    if(remove){
      $(".posts").children(".job").each(function(){
        if(should_be_deleted($(this).attr("id"),data)){
          changes = true;
          $(this).slideUp({complete:function(){$(this).remove();}});
        }
      });
    }
    var i=0;
    $.each(data,function(){
      if (is_even(i)) {
        if(!remove || check_for_existance(this.job.id)){
          changes = true;
          $(".posts.even").append(job_template(this.job));
          if(remove) {
            $(".posts.even").children('.job').last().hide();
            $(".posts.even").children('.job').last().slideDown(700).delay(200);
          }
        }
      } else {
        if(!remove || check_for_existance(this.job.id)){
          changes = true;
          $(".posts.odd").append(job_template(this.job)); 
          if(remove) {
            $(".posts.odd").children('.job').last().hide();
            $(".posts.odd").children('.job').last().slideDown(700).delay(200);
          }

        }
      }
      i++;
    });
    if(remove) {
      setTimeout(function() {calibrate();}, 500);
      if(!changes){
        $(".posts").animate({opacity:'0.3'},500);
        $(".posts").animate({opacity:'100'},5900);
        // $(".posts").fadeTo(500,0.2);
        // $(".posts").fadeTo(500,1.0); 
      }
    } else {
      calibrate();
      can_send = true;
    }

    $("#loader img").animate({opacity:'hide'});
  });
}

function get_json_path(){
  if($("#endless_path").val()=="my_jobs") 
    return ("/companies/"+ $("#endless_path").attr("company") +"/my_jobs.json");
  return "/jobs.json"
}

function calibrate(){

  var evens = 0;
  var odds = 0;
  $(".posts.even").children(".job").each(function(){evens++;});
  $(".posts.odd").children(".job").each(function(){odds++;});
  do {
    if(odds > evens) {
      $(".posts.odd").children(".job").last().appendTo(".posts.even")
    } else if(evens - 1 > odds) {
      $(".posts.even").children(".job").last().appendTo(".posts.odd")
    }
    evens = odds = 0;
    $(".posts.even").children(".job").each(function(){evens++;});
    $(".posts.odd").children(".job").each(function(){odds++;});
    // alert(evens +"   "+odds);
  }while((evens-1)!=odds && (odds-1)!=evens && evens!=odds);
}

function check_for_existance(id) {
  rtn = true;
  $(".posts").children(".job").each(function(){    
    if(id == this.id) {
      rtn = false;
    }
  });
  return rtn;
}
function should_be_deleted(job_id,data) {
  i = true;
  $.each(data,function(){
    if(job_id == this.job.id){
      i = false;
    }
  });
  return i;
}
//renders a job template 
function condensed_info(job){

  str = job.company.title + " en " + job.city ;
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
  str += "<a href=\"/jobs/"+job.id+"\">";
  str += "<div class=\"span-4 prepend-8 last\">";
  str += "<img alt=\""+job.company.title+"\" src=\""+job.company.logo_url+"\" /></div>";
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

//checks for the existance of scrollbar
// (function($) {
//   $.fn.hasScrollBar = function() {
//     alert(document.documentElement.scrollHeight === document.documentElement.clientHeight);
//     return (document.documentElement.scrollHeight === document.documentElement.clientHeight);
//     // return (this.get(0).scrollHeight > this.height() && $(window).scrollTop() == 0 );
//   }
// })(jQuery);


//renders new jobs when scroll reaches the bottom
$(window).scroll(function(){
  var i=0;
  if(isScrollBottom() && can_send){
    can_send = false;
    current_page++;
    var filter_info = get_checkbox_status("#mainMenu input");
    getJobsJSON(filter_info,false) 
  }
});
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

  // if ($(window).hasScrollBar() && can_send){
  //   can_send = false;
  //   current_page++;
  //   var filter_info = get_checkbox_status("#mainMenu input");
  //   getJobsJSON(filter_info,false) 
  // }

  $("#mainMenu input").click(function(){
    $("#loader").remove();
    $("#header").append("<div id=\"loader\"><img alt=\"Loader\"src=\"/images/ajax-loader.gif\"  /></div>");
    $("#loader").hide().fadeIn();

    current_page=1;
    var filter_info = get_checkbox_status("#mainMenu input");
    if(countChecked(filter_info) == 4) {
      $("#mainMenu input").each(function() {
        $(this).attr('checked', true);
      });
    }
    getJobsJSON(filter_info,true);

    $("#loader").fadeOut();

  });

});

