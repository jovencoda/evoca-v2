
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

   function addMarker(location){
     var str = location.slice(17, -1);
     var coordinates = str.split(" ");
     marker = new L.marker([parseFloat(coordinates[1]), parseFloat(coordinates[0])])
     .bindPopup("Content")
     .addTo(mymap);
   }

   // Make data petition
   $.ajax({
       url: "http://192.168.33.10:8000/api/v1/channel/"+ channelID +"/records/?format=json"
   }).then(function(data) {
     var reports = data.slice(0);
     $(reports).each(function(i){
       addMarker(reports[i].location);
     });

   });


});
