$(document)
   .ready(function() {

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

    var mymap = L.map('channel-map').setView([51.505, -0.09], 13);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1Ijoiam92ZW5jb2RhIiwiYSI6ImNqNmIyZTYzdDE5YmQydm55eHduY2tqMm0ifQ.Uom9N7tSPmM0hqapPXAfFg'
    }).addTo(mymap);

   });

   function populateMenu(){
   menu = d3.select("#channel-menu");
    $.ajax({
        url: "http://192.168.33.10:8000/api/v1/channel/?format=json"
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
