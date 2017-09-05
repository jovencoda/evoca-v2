
$(document)
   .ready(function() {

   // Load channel id
   channelID = $("#channel-map").attr('uniqueID');
   // Create Map
   var mymap = L.map('channel-map').setView([3.44, -76.52], 13);
   L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
       attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
       maxZoom: 18,
       id: 'mapbox.outdoors',
       accessToken: 'pk.eyJ1Ijoiam92ZW5jb2RhIiwiYSI6ImNqNmIyZTYzdDE5YmQydm55eHduY2tqMm0ifQ.Uom9N7tSPmM0hqapPXAfFg'
   }).addTo(mymap);

   var markers = L.markerClusterGroup({ chunkedLoading: true });

   var popupContent = '<div class="ui card">'+
   '<div class="content">'+
   '<div class="right floated meta">{{ record.created_at }}</div>'+
   '<i class="at icon"></i>{{ record.author }}'+
   '</div>'+
   '<div class="image">'+
         '<button class="ui compact labeled icon button green player">'+
          ' <i class="play icon"></i>'+
           '<span class="audio-label">Reproducir</span>'+
           '<audio preload="none">'+
             '<source src="{{ record.getAttachedAudio.url }}" type="audio/mpeg">'+
            ' Your browser does not support the audio element.'+
           '</audio>'+
         '</button>'+
         '<a><img class="card-img" src="{{ record.getAttachedImage.url }}"></a>'+
       '</div>'+
       '<div class="content">'+
         '{{ record.getLongPlace }}'+
       '</div>'+
       '<div class="content">'+
           '<a href="/tag/{{ tag.slug }}" class="ui label">{{ tag.slug }}</a>'+
       '</div>'+
       '<div class="ui bottom attached green progress"  data-percent="0">'+
         '<div class="bar"></div>'+
       '</div>'+
     '</div>';

   function addMarker(location, markers){
     var str = location.slice(17, -1);
     var coordinates = str.split(" ");
     var marker = new L.marker([parseFloat(coordinates[1]), parseFloat(coordinates[0])])
      .bindPopup(popupContent)
      .on('click', function(i){
        console.log("open")
      });

     return marker;
   }

   // Make data petition
   $.ajax({
       url: "http://192.168.33.10:8000/api/v1/channel/"+ channelID +"/records/?format=json"
   }).then(function(data) {
     var reports = data.slice(0);

     $(reports).each(function(i){
       markers.addLayer(addMarker(reports[i].location));
     });

     mymap.addLayer(markers);

   });


});
