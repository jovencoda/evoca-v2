var baseURL = window.location.protocol
+'//'+window.location.hostname+(location.port ? ':'+location.port: '');
$(document)
   .ready(function() {

      $(window).bind('scroll', function () {
          if ($(window).scrollTop() > 80) {
              $('.menug').addClass('fixed');
          } else {
              $('.menug').removeClass('fixed');
          }
      });

      $('.ui.sidebar').sidebar('attach events', '.toc.item');



     $('.ui.dropdown').dropdown();
     $('.ui.menu a.item')
       .on('click', function() {
         $(this)
           .addClass('active')
           .siblings()
           .removeClass('active')
         ;
       });

    populateMenu();
    audioPlayers();
    parseTimes();

   });

   function csrfSafeMethod(method) {
       // these HTTP methods do not require CSRF protection
       return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
   }
   function getCookie(name) {
       var cookieValue = null;
       if (document.cookie && document.cookie != '') {
           var cookies = document.cookie.split(';');
           for (var i = 0; i < cookies.length; i++) {
               var cookie = jQuery.trim(cookies[i]);
               // Does this cookie string begin with the name we want?
               if (cookie.substring(0, name.length + 1) == (name + '=')) {
                   cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                   break;
               }
           }
       }
       return cookieValue;
   }
   var csrftoken = getCookie('csrftoken');

   function parseTimes(){
     var formatTime = d3.timeFormat("%B %d, %I:%M");
     var times = d3.selectAll(".time")

     $(times).each(function(i){
       var date = new Date($(this).html());
       $(this).html(formatTime(date));
     });



   }

   function populateMenu(){
   menu = d3.select("#channel-menu");
    $.ajax({
        url: baseURL+"/api/v1/channel/?format=json"
    }).then(function(data) {
      channels = []
      $(data).each(function(i){
          channels.push({name: data[i]['name'], value:data[i]['uniqueID'], selected: true})
          menu.append("a")
              .attr("class", "item")
              .attr("href", "/" + data[i]['slug'] )
              .html(data[i]['name']);
      });
    });

   }

   function audioPlayers(){
     audio = null;
     players = d3.selectAll(".player").on("click", function(d){
       icon = $(this).children();
       audio = $(this).find("audio")[0];
       progress = $(audio).parent().parent().find(".progress");
       if(icon.hasClass("play")){
         // Play audio
         toogleIcon(icon, 'play');
         audio.play();
       }else{
         // Stop audio
         toogleIcon(icon, 'stop');
         audio.pause();
       }
     });

     $("audio").each(function(i){
       this.ontimeupdate = function() {updateProgress(this)};
       this.onended = function(){
         progress = $(this).parent().parent().parent().find(".progress");
         icon = $(this).parent().find(".icon");
         toogleIcon(icon, 'stop');
         progress.progress({percent: 0});
       }
     });

     function updateProgress(audio){
        // Update time
        progress = $(audio).parent().parent().parent().find(".progress");
        progress.progress({percent: parseInt((audio.currentTime*100)/audio.duration)});
     }

     function toogleIcon(icon, value){
       if(value=='play'){
         icon.removeClass("play");
         icon.parent().find(".audio-label").html("Pausar");
         icon.addClass("pause");
       }else{
         icon.removeClass("pause");
         icon.parent().find(".audio-label").html("Reproducir");
         icon.addClass("play");
       }
     }

   }
