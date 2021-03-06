var mymap;
var lugares;
$("document").ready(function () {
    mymap = L.map('mapaid').setView([19.433297, -99.133511], 17);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
                                '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                                'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                        id: 'mapbox.streets'
                }).addTo(mymap);
            lugares = document.getElementById("collap").getElementsByTagName("li").length;
            for (var i = 1; i < lugares; i++) {
                  var nom = document.getElementById("nombrelugar"+i).innerHTML;
                    console.log(nom);
                    for ( var j=0; j < markers.length; j++ ) 
                    {
                       console.log(markers[j].name);
                       if (nom == markers[j].name){
                           L.marker( [markers[j].lat, markers[j].lon] )
                          .bindPopup( '<h5>' + markers[j].name + '</h5>' )
                          .addTo( mymap );
                          break;
                        }
                    }
             }
    $('.sidenav').sidenav();
    $('.collapsible').collapsible();
    $('.tabs').tabs();
    $(".dropdown-trigger").dropdown({
      coverTrigger: false,
      constrainWidth: false
    });
    $("#butMF").hide();
    $("#butVG").click(function () {
        var date = $("#fecha").val();
        if (date != null && date != '') {
            $.post("buscarguia.jsp",
                    {
                        date: date
                    },
                    function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                        var json= JSON.parse(data);
                        console.log(json);
                        $("#nomguia").val(json.nombre +" "+json.apellidoP +" "+json.apellidoM);
                        $("#corguia").val(json.correo);
                        $("#ag").val(json.id);
                        $("#butVG").hide();
                        $("#butMF").show();
                    });
        }
    });
    $("#butMF").click(function (){
        var date = $("#fecha").val();
        var duracion = $("#tiempo").val();
        var costo = $("#costo").val();
        var ruts = $("#important").val();
        var guia = $("#ag").val();
        alert(date + duracion + costo + ruts + guia);
        if (date != null && date != '') {
            $.post("guardarTour.jsp",
                    {
                        date: date,
                        tiempo: duracion,
                        costo: costo,
                        important: ruts,
                        guia: guia
                    },
                    function (data, status) {
                        if(action(data)){
                            alert(data);
                            location.replace("datosTour.jsp");
                        }
                        else {
                            alert(data);
                        }
                    });
        }
    });

});

function action(data){
    var reg = /Tour\sguardado\scon\séxito/;
    return reg.test(data);
}