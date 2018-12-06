$(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {
     center: new google.maps.LatLng({lat: -33.5, lng: -70.7}),
     zoom: 10
    },
    internal: {
     id: 'map'
    }
  },
  function(){
   markers = handler.addMarkers(hash);
   google.maps.event.addListener(handler.getMap(), "center_changed", function(e){
     var new_center = handler.getMap().getCenter();
     var latitude = new_center.lat();
     var longitude = new_center.lng();

     $.ajax({
      url: '/locations',
      type: 'GET',
      dataType: 'script',
      data: {latitude: latitude, longitude: longitude}
     });
   });

  });
});
