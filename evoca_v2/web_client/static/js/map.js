
$(document)
   .ready(function() {

   $.ajax({
       url: "http://192.168.33.10:8000/api/v1/records/?format=json"
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

    var mymap = L.map('channel-map').setView([51.505, -0.09], 13);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.outdoors',
        accessToken: 'pk.eyJ1Ijoiam92ZW5jb2RhIiwiYSI6ImNqNmIyZTYzdDE5YmQydm55eHduY2tqMm0ifQ.Uom9N7tSPmM0hqapPXAfFg'
    }).addTo(mymap);

});
