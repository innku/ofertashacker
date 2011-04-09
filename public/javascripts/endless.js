//dimScreen()
//by Brandon Goldman
jQuery.extend({
    //dims the screen
    dimScreen: function(speed, opacity, callback) {
        if(jQuery('#__dimScreen').size() > 0) return;
        
        if(typeof speed == 'function') {
            callback = speed;
            speed = null;
        }

        if(typeof opacity == 'function') {
            callback = opacity;
            opacity = null;
        }

        if(speed < 1) {
            var placeholder = opacity;
            opacity = speed;
            speed = placeholder;
        }
        
        if(opacity >= 1) {
            var placeholder = speed;
            speed = opacity;
            opacity = placeholder;
        }

        speed = (speed > 0) ? speed : 500;
        opacity = (opacity > 0) ? opacity : 0.5;
        return jQuery('<div></div>').attr({
                id: '__dimScreen'
                ,fade_opacity: opacity
                ,speed: speed
            }).css({
            background: '#000'
            ,height: '100%'
            ,left: '0px'
            ,opacity: 0
            ,position: 'absolute'
            ,top: '0px'
            ,width: '100%'
            ,zIndex: 999
        }).appendTo(document.body).fadeTo(speed, opacity, callback);
    },
    
    //stops current dimming of the screen
    dimScreenStop: function(callback) {
        var x = jQuery('#__dimScreen');
        var opacity = x.attr('fade_opacity');
        var speed = x.attr('speed');
        x.fadeOut(speed, function() {
            x.remove();
            if(typeof callback == 'function') callback();
        });
    }
});

var current_page=1; //current_page for pagination

function getJobsJSON(filter_info,remove){
  $.getJSON('/jobs.json',{filters: { full_time:filter_info[0],
                                       part_time:filter_info[1],
                                       flexible:filter_info[2],
                                       remote:filter_info[3],
                                       },page:current_page }, 
              function(data) {
                if(remove){
                  $(".posts").children(".job").each(function(){
                   if(should_be_deleted($(this).attr("id"),data)){
                      $(this).remove();
                    }
                 });
                }
                var i=0;
                $.each(data,function(){
                    if (is_even(i)) {
                        if(!remove || check_for_existance(this.job.id)){
                          $(".posts.even").append(job_template(this.job));
                        }
                    } else {
                        if(!remove || check_for_existance(this.job.id)){
                          $(".posts.odd").append(job_template(this.job)); 
                          
                        }
                    }
                    i++;
                });
                if(remove) {
                  calibrate(); 
                }
            });



}
function calibrate(){
  evens = 0;
  odds = 0;
  iguales = 0;
  do {
  $(".posts.even").children(".job").each(function(){evens++;});
  $(".posts.odd").children(".job").each(function(){odds++;});

  if(odds-1 > evens) {
    $(".posts.odd").children(".job").last().appendTo(".posts.even")
  } else if(evens - 1 > odds) {
    $(".posts.even").children(".job").last().appendTo(".posts.odd")
  } else {
  }
  iguales++;
  }while(iguales < 10);
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
    if (str.length<=70)
        return str;
    return str.substring(0,70) + "...";
    
}

//renders a job template 
function job_template(job) {
    var str="<li class=\"job\"" + " id=\"" + job.id +"\" >";
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
        current_page++;
      var filter_info = get_checkbox_status("#mainMenu input");
        getJobsJSON(filter_info,false);
    }
});
//checks if scroll has reached the bottom
function isScrollBottom() {
  var documentHeight = $(document).height();
  var scrollPosition = $(window).height() + $(window).scrollTop();
  return (documentHeight <= (200 + scrollPosition));
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
    $("body").append("<div id=\"loader\"><p>Cargando Ofertas...</p><img alt=\"Loader\"src=\"/images/ajax-loader.gif\"  /></div>");
    $("#loader").hide();
    $("#mainMenu input").click(function(){
        $('#loader').fadeIn();
        $.dimScreen(500, 0.7, null);
        current_page=1;
        var filter_info = get_checkbox_status("#mainMenu input");
        if(countChecked(filter_info) == 4) {
            $("#mainMenu input").each(function() {
                $(this).attr('checked', true);
            });
        }
        getJobsJSON(filter_info,true);
        $.dimScreenStop();
        $("#loader").fadeOut();
      });

});



