
$(document)
   .ready(function() {

    generateMap();

});

function generateMapFilters(map, markers, _markers){

  var userFilter = d3.selectAll(".map-filter").on('click', function(i){
  var type = $(this).attr('type');
  var query = $(this).html().replace(/\s/g,'');

    markers.clearLayers();
    filterMarkers(type, query, markers, _markers);

  });

}

function filterMarkers(type, query, markers, _markers){

  $(_markers).each(function(i){
    switch (type) {
      case 'author':
        if(_markers[i].author == query){ // author filter
          markers.addLayer(_markers[i]);
        }
        break;
      case 'tag':
        if(_markers[i].tags.includes(query)){ // author filter
          markers.addLayer(_markers[i]);
        }
        break;
      case 'null':
          markers.addLayer(_markers[i]);
        break;
    }
  });
}


function generateMap() {

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

  function addMarker(report, markers){
    var str = report.location.slice(17, -1);
    var coordinates = str.split(" ");
    var marker = new L.marker([parseFloat(coordinates[1]), parseFloat(coordinates[0])])
     .bindPopup('<div id="map-popup" class="ui" style="width:270px;"><div class="ui active inverted dimmer"><div class="ui text loader">Cargando</div></div><p></p></div>')
     .on('popupopen', function(i){
       var popup = this._popup._content;

       $.ajax({
           url: "http://192.168.33.10:8000/api/v1/channel/" + channelID + "/records/" + report.uniqueID
       }).then(function(report) {

         var tags = '';

         // Get tags and create html
         if( report.tags.length > 0){
            tags += '<div class="content">';
           $(report.tags).each(function(i){
               tags += '<a href="/tag/' + report.tags[i] + '" class="ui label">' + report.tags[i] + '</a>';
           });
           tags += "</div>";
         }
         // Get attachments and create html
         $.ajax({
             url: "http://192.168.33.10:8000/api/v1/channel/" + channelID + "/records/" + report.uniqueID + "/attachments/"
         }).then(function(attachments) {

           var image_url = '/static/img/image.png';
           var audio_url = '';

           $(attachments).each(function(i){

             if(attachments[i].attachment_type == 0){ // is image
               image_url = attachments[i].url;
               console.log(image_url);
             }else if(attachments[i].attachment_type == 3){ // is audio
                 audio_url = '<button class="ui compact labeled icon button green player">'+
                ' <i class="play icon"></i>'+
                 '<span class="audio-label">Reproducir</span>'+
                 '<audio preload="none">'+
                   '<source src="' + attachments[i].url + '" type="audio/mpeg">'+
                  ' Your browser does not support the audio element.'+
                 '</audio>'+
               '</button>';
             }
           });

           var popupContent = '<div class="ui card">'+
           '<div class="content">'+
           '<div class="right floated meta time">' + report.created_at + '</div>'+
           '<i class="at icon"></i>'+ report.author +
           '</div>'+
           '<div class="image">'+
                 audio_url+
                 '<a><img class="card-img" src="' + image_url + '"></a>'+
               '</div>'+
               '<div class="content">'+
                 report.address + ", " + report.region + ", " + report.city + ", " + report.country +
               '</div>'+
               tags +
               '<div class="ui bottom attached green progress"  data-percent="0">'+
                 '<div class="bar"></div>'+
               '</div>'+
             '</div>';

             $('#map-popup').html(popupContent);
             audioPlayers();
              parseTimes();

         });


       });

     });

    // Add filtering metadata to marker
    marker.tags = report.tags;
    marker.author = report.author;

    return marker;
  }

  // Make data petition
  $.ajax({
      url: "http://192.168.33.10:8000/api/v1/channel/" + channelID + "/records/?format=json"
  }).then(function(data) {
    var reports = data.slice(0);

    var _markers = []
    $(reports).each(function(i){
      markers.addLayer(addMarker(reports[i]));
      _markers.push(addMarker(reports[i]))
    });

    //var markers_layer = L.layerGroup(_markers);
    mymap.addLayer(markers);

    // Create map filtering options
    generateMapFilters(mymap, markers, _markers);

  });


}
