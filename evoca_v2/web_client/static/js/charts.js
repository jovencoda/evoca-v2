var baseURL = window.location.protocol
+'//'+window.location.hostname+(location.port ? ':'+location.port: '');
$(document)
   .ready(function() {

    generateTagsChart();
    generateRecordsChart();

});


function generateRecordsChart(){

  $.ajax({
      url: baseURL+"/api/v1/channel/" + channelID + "/time/",
      headers: {
          'Authorization':'Token ' + api_token,
          'X_CSRF_TOKEN': csrftoken,
          'Content-Type':'application/json'
      },
  }).then(function(data) {

    var c = $("#timeline-chart").parent().children().first();

    if(JSON.stringify(data)!='{}'){

      var date = [];
      var count = [];

      date.push('date');
      count.push('x');

      for (var prop in data) {
       date.push(prop + "-01");
       count.push(data[prop]);
      }

      var chart = c3.generate({
          bindto: '#timeline-chart',
          data: {
              x: 'date',
              columns: [date, count],
              names: {
                y: 'Fecha',
                x: 'Número de Reportes'
              }
          },
          axis: {
              x: {
                  type: 'timeseries',
                  tick: {
                      format: '%Y-%m'
                  }
              }
          }
      });

      c.removeClass('active');
      c.addClass('disabled');

    }else{

      console.log(c.children().first());
      c.children().first().html("No hay suficientes datos");

    }

  });


}

function generateTagsChart(){
  // Make data petition
  $.ajax({
      url: baseURL+"/api/v1/channel/" + channelID + "/tags/",
      headers: {
          'Authorization':'Token ' + api_token,
          'X_CSRF_TOKEN': csrftoken,
          'Content-Type':'application/json'
      },
  }).then(function(data) {

    var c = $("#tags-chart").parent().children().first();

    if(JSON.stringify(data)!='{}'){
      var chart = c3.generate({
          bindto: '#tags-chart',
          data: {
              json: data,
              type : 'donut',
              //onclick: function (d, i) { console.log("onclick", d, i); },
              //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
              //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
          },
          donut: {
              title: "% por categoría"
          }
      });

      c.removeClass('active');
      c.addClass('disabled');

    }else{

      c.children().first().html("No hay suficientes datos");

    }

  });


}
