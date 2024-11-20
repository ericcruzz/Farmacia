function getUbicacion() {
    //Verifica si tenemos habilitada la geolocalizacion
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geoOK, GeoKO);
    }
    dibujaMapaUbicacion();
}

function geoOK(position) {
    console.log(position);
}


function GeoKO(err) {
    if (err.code == 1) {
        console.log("El usuario negó el permiso");
    }
    else if (err.code == 2) {
        console.log("No se puede determinar la ubicación");
    }
    else if (err.code == 3) {
        console.log("Tiempo de respuesta Expirada");
    }
    else {
        error("Error" + err, code);
    }
}

function error(error) {
    alert(error);
}


function dibujaMapaUbicacion() {
    var coordenadas = { Lat: 0, Lng: 0 };
    function localizacion(posicion) {
        if (lat == 0) { // no tengo coordenadas
            coordenadas = {
                Lat: posicion.coords.latitude,
                Lng: posicion.coords.longitude
            };
        }
        else {
            coordenadas = { // si tengo coordenadas
                Lat: document.getElementById("lat").value,
                Lng: document.getElementById("lng").value

            };
        }
        //Opcion para dibujar el mapa
        var miscoordenadas = new google.maps.LatLng(coordenadas.Lat, coordenadas.Lng);
        var mapOptions = {
            zoom: 16,
            center: miscoordenadas,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        //Cargamos el mapa en el HTML
        var map = new google.maps.Map(document.getElementById('mapid'), mapOptions);
        //Marcador de google
        var marker = new google.maps.Marker({
            position: miscoordenadas,
            title: "Ubicacion Farmacia"
        });

        marker.setMap(map);
        $("#mapid").css("height", 350);

        var panorama = new google.maps.StreetViewPanorama(document.getElementById("street"), { position: miscoordenadas, pov: { heading: 90, pitch: 5 } });
        map.setStreetView(panorama);
        $("#street").css("height", 300);

    }
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(localizacion, error);
    }
}