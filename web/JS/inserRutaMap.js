	var mymap;
        var zona;
        var lugares;
	window.onload = function(){
            lugares = document.getElementById("lugaresRuta").getElementsByTagName("li").length;
                alert(lugares);
            mymap = L.map('mapaid').setView([19.433297, -99.133511], 17);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
                                '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                                'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                        id: 'mapbox.streets'
                }).addTo(mymap);

//            L.marker([51.5, -0.09]).addTo(mymap)
//                    .bindPopup("<b>Hello world!</b><br />I am a popup.").openPopup();

             for (var i = 0; i < lugares; i++) {
                  var nom = document.getElementById("nombrelugar"+i).innerHTML;
                    console.log(nom);
                    for ( var j=0; j < markers.length; j++ ) 
                    {
                       console.log(markers[j].name);
                       if (nom == markers[j].name){
                           L.marker( [markers[j].lat, markers[j].lon] )
                          .bindPopup( '<h3>' + markers[j].name + '</h3>' )
                          .addTo( mymap );
                          break;
                        }
                    }
             }
             mymap.on('click', onMapClick);
  };

	var popup = L.popup();

	function onMapClick(e) {
		popup
			.setLatLng(e.latlng)
			.setContent("You clicked the map at " + e.latlng.toString())
			.openOn(mymap);
	}
