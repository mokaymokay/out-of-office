var map, infoWindow;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {
            lat: 40.782427,
            lng: -73.9759587
        },
        zoom: 15
    });
    infoWindow = new google.maps.InfoWindow;

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            new google.maps.Geocoder().geocode({
                'latLng': pos
            },
                function(res, status) {
                    if (status == 'OK') {
                        let zip = res[0].formatted_address.match(/,\s\w{2}\s(\d{5})/);
                        let neighborhood = res[2].address_components[0]['short_name'];
                        getZipCodeAndNeighborhood(zip[1], neighborhood);
                    }
                }
            );
            infoWindow.setPosition(pos);
            infoWindow.setContent('Current location');
            infoWindow.open(map);
            map.setCenter(pos);
        }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
        'Error: The Geolocation service failed.' :
        'Error: Your browser does not support geolocation.');
    infoWindow.open(map);
}

function getZipCodeAndNeighborhood(zipCode, neighborhood) {
    // set form values in hidden form
    $('#user_zip_code').val(zipCode);
    $('#user_neighborhood').val(neighborhood);
}
