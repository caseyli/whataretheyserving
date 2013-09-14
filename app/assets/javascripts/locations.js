var geocoder;
$(function(){
  geocoder = new google.maps.Geocoder();
  $(".use-my-location").click(initiateGeolocation);

});

function changeUseMyLocationState(state) {
  if(state == "loading") {
    $(".use-my-location").append("<i class='icon-refresh icon-spin'></i>");
  }
  else {
    $(".use-my-location").html("<i class='icon-location-arrow'></i> Use My Location");
  }
}

function loadLocationForm(street_address, city, province_state, postal_zip) {
  $("#location_street").val(street_address);
  $("#location_city").val(city);
  $("#location_prov_state").val(province_state);
  $("#location_postal_zip").val(postal_zip);
}

function initiateGeolocation() {
  changeUseMyLocationState("loading");
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
      // Cycle through results
      var street_address_index = -1;
      for(var i=0; i < results.length; i++) {
        // Check to see if the types contains "street_address"
        for(var j=0; j < results[i].types.length; j++) {
          if(results[i].types[j] == "street_address") {
            street_address_index = i;
            break;
          }
        }
      }
    
      //find country name
      var street_number_found = false;
      var street_number = "";
      var route_found = false;
      var route = "";
      var city_found = false;
      var city = "";
      var province_state_found = false;
      var province_state = "";
      var postal_zip_found = false;
      var postal_zip = "";
    
    
      if(street_address_index > -1) {
        // Cycle through address components of 'street_address'
        var street_address = results[street_address_index];
        for(var i=0; i < street_address.address_components.length; i++) {
        
          // Cycle through types of the address component
          for(var j=0; j < street_address.address_components[i].types.length; j++) {
            if(street_address.address_components[i].types[j] == "street_number") {
              street_number = street_address.address_components[i].short_name;
              street_number_found = true;
            }
          
            if(street_address.address_components[i].types[j] == "route") {
              route = street_address.address_components[i].short_name;
              route_found = true;
            }
          
            if(street_address.address_components[i].types[j] == "locality") {
              city = street_address.address_components[i].short_name;
              city_found = true;;
            }
          
            if(street_address.address_components[i].types[j] == "administrative_area_level_1") {
              province_state = street_address.address_components[i].short_name;
              province_state_found = true;
            }
          
            if(street_address.address_components[i].types[j] == "postal_code") {
              postal_zip = street_address.address_components[i].short_name;
              postal_zip_found = true;
            }
          
            if(street_number_found && route_found && city_found && province_state_found && postal_zip_found) {
              break;
            }
          }
        }
      
        //Gathered data
        changeUseMyLocationState("default");
        loadLocationForm(street_number + " " + route, city, province_state, postal_zip);
      
      }
      else {
        alert("We're sorry, we could not find your location.");
      }
    }      
  });
}