/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
            
            for (var i = 0; i < lugares; i++) {
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
});

function cancelar(tour){
    var reason, password;
    reason = $("#textarea1").val();
    password = $("#pass").val();
    
    if (validPass(password) && validRazon(reason)) {
         $.post("cancelarTour.jsp",
                    {
                        tour: tour,
                        why: reason,
                        pass: password
                    },
                    function (data, status) {
                       if (action(data)) {
                           alert("Se ha cancelado su tour");
                           location.replace("planearRuta.jsp");
                        } else {
                           alert(data);
                       }
                    });
    }   

}


function validPass(pass){
    var reg= /^[\w+*&%$#¿?!¡]{8,16}$/;
    if (!reg.test(pass)){
       alert("Ingresa una contraseña de 8 a 16 caracteres.");
      return false;
    }
    else{
        alert("pass: true");
        return true;
    }
}

function validRazon(string){
    var letters = /^([A-Za-zñÑÁÉÍÓÚñáéíóú]+\s{0,1})+$/;
	if(letters.test(string)){
		return true;
	}
	else {
		alert ("En la razón solo puedes poner letras.");
		return false;
	}
     
}

function action(data){
    var reg = /cancelado/;
    return reg.test(data);
}