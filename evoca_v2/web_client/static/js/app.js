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

     players = d3.selectAll(".player").on("click", function(d){
       icon = $(this).children();
       audio = $(this).find("audio")[0];
       if(icon.hasClass("play")){
         // Play audio
         toogleIcon(icon, 'play');
         audio.play();
       }else{
         // Stop audio
         toogleIcon(icon, 'stop');
         audio.pause();
       }
       // ON end toggle icon
       audio.onended = function(){
         toogleIcon(icon, 'stop');
       }
     });

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
