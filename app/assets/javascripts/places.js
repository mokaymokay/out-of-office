
 var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {
            lat: 40.7079748,
            lng: -74.006553
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
              function (res, status) {
                var zip = res[0].formatted_address.match(/,\s\w{2}\s(\d{5})/);
              console.log(zip[0,1]);
              }
              
            );
          
            
            
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
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

      // NOTE: Geocoder 's default IP address lookup has changed from FreeGeoIP.net to IPInfo.io. If you explicitly specify :freegeoip in your configuration you must choose a different IP lookup before FreeGeoIP is discontinued on July 1, 2018. If you do not explicitly specify :freegeoip you do not need to change anything.
