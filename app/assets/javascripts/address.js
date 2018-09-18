$(document).ready(function() {

  $('.form-switch').on('change', function() {
    $('.form').removeClass('active');
    var formToShow = '.form-' + $(this).data('id');
      $(formToShow).addClass('active');
  });


  var latlng = new google.maps.LatLng(39.305, -76.617); 
  map = new google.maps.Map(document.getElementById('map_canvas'), {
    center: latlng,
    zoom: 12
  });

  $("#geocomplete").geocomplete();

  var geocoder = new google.maps.Geocoder();

  google.maps.event.addListener(map, 'click', function(event) {
    geocoder.geocode({
      'latLng': event.latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
         setSerach(results[0], "click")
        }
      }
    });
  });

  var searchBox = new google.maps.places.SearchBox(document.getElementById('geocomplete'))
  google.maps.event.addListener(searchBox, 'places_changed', function() {
  var results = searchBox.getPlaces()[0];
    setSerach(results, "type")
  });

  function setSerach(results, type={}){
    var geocomplete = $('#geocomplete');
    var address = $('#geocomplete1');
    geocomplete.val(results.formatted_address);
    if(type ==="click")
    {
      var l = results.address_components.length - 1 ;
      address.val(results.address_components[l].long_name)
    }else{
      address.val(results.address_components[0].long_name)
    }

  }

});