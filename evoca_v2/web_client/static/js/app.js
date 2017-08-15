$(document)
   .ready(function() {

     $('.ui.menu .ui.dropdown').dropdown({
       on: 'hover'
     });

     $('.ui.menu a.item')
       .on('click', function() {
         $(this)
           .addClass('active')
           .siblings()
           .removeClass('active')
         ;
       });

    audioPlayers();



   });

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
         icon.addClass("pause");
       }else{
         icon.removeClass("pause");
         icon.addClass("play");
       }
     }

   }
