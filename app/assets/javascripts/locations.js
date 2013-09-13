var geocoder;
$(function(){
  geocoder = new google.maps.Geocoder();
  $(".use-my-location").click(initiateGeolocation);
  
});

function initiateGeolocation() {
  navigator.geolocation.getCurrentPosition(useLocation, handleLocationErrors);
  return false;
}

function useLocation(position){
  reverseGeocodeLatLong(position.coords.latitude, position.coords.longitude);
}

function handleLocationErrors(error) {
  
}

function reverseGeocodeLatLong(lat, lng) {
  var latlng = new google.maps.LatLng(lat, lng);
  geocoder.geocode({'latLng': latlng}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
                
        //find country name
        var street_found = false;
        var street = "";
        var city_found = false;
        var city = "";
        var province_state_found = false;
        var province_state = "";
        var postal_zip_found = false;
        var postal_zip = "";
        
        for (var i=0; i<results[0].address_components.length; i++) {
          for (var j=0;j<results[0].address_components[i].types.length;j++) {
            
            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
            if (results[0].address_components[i].types[j] == "street_address") {
              //this is the object you are looking for
              street = results[0].address_components[i];
              street_found = true;
            }
            if (results[0].address_components[i].types[j] == "administrative_area_level_3") {
              //this is the object you are looking for
              city = results[0].address_components[i];
              city_found = true;
            }
            if (results[0].address_components[i].types[j] == "administrative_area_level_1") {
              //this is the object you are looking for
              province_state = results[0].address_components[i];
              province_state_found = true;
            }
            if (results[0].address_components[i].types[j] == "postal_code") {
              //this is the object you are looking for
              postal_zip = results[0].address_components[i];
              postal_zip_found = true;
            }
            
            if(street_found && city_found && province_state_found && postal_zip_found) {
              break;
            }
            
          }
        }
        
        //Gathered data
        alert(street.long_name + ", " + city.long_name + ", " + province_state.long_name + ", " + postal_zip_found.long_name);


      } else {
        alert("No results found");
      }
    } else {
      alert("Could not locate due to: " + status);
    }
  });
}