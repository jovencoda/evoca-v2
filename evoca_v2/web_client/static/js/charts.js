
$(document)
   .ready(function() {

    generateTagsChart();
    generateRecordsChart();

});


function generateRecordsChart(){
  var chart = c3.generate({
      bindto: '#timeline-chart',
      data: {
        columns: [
          ['data1', 30, 200, 100, 400, 150, 250],
          ['data2', 50, 20, 10, 40, 15, 25]
        ]
      }
  });


}

function generateTagsChart(){
  // Make data petition
  $.ajax({
      url: "http://192.168.33.10:8000/api/v1/channel/" + channelID + "/tags/",
      headers: {
          'Authorization':'Token ' + api_token,
          'X_CSRF_TOKEN': csrftoken,
          'Content-Type':'application/json'
      },
  }).then(function(data) {

    var chart = c3.generate({
        bindto: '#tags-chart',
        data: {
            json: data,
            type : 'donut',
            onclick: function (d, i) { console.log("onclick", d, i); },
            onmouseover: function (d, i) { console.log("onmouseover", d, i); },
            onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        },
        donut: {
            title: "% categoría"
        }
    });

    var c = $("#tags-chart").parent().children().first();

    c.removeClass('active');
    c.addClass('disabled');


  });


}
