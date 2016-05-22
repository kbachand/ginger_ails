$(document).ready(function () {

 function initialize() {
   var myLatLng = new google.maps.LatLng(35.260993, -80.819401);
   var markerPosition = new google.maps.LatLng(latitude, longitude);

   var mapOptions = {
       center: myLatLng,
       zoom: 12,
       scrollwheel: false
   };

   var map = new google.maps.Map(document.getElementById('sa-ck-map'), mapOptions
     );

    var deliveryAreaCoordinates = [
        {lat: 35.27687926872875, lng: -80.80040683884133},  
		{lat: 35.27809169674679, lng: -80.80296626770577}, 
		{lat: 35.27705615053044, lng: -80.81040291135393},
		{lat: 35.2745060372283, lng: -80.8189057180755},
		{lat: 35.2744849, lng: -80.82664491},
		{lat: 35.27257648, lng: -80.83128037},
		{lat: 35.27254799, lng: -80.84134156},
		{lat: 35.27285724, lng: -80.84366485},
		{lat: 35.27095609, lng: -80.84559126},
		{lat: 35.26906167, lng: -80.84519578},
		{lat: 35.26527847, lng: -80.84247019},
		{lat: 35.26149531, lng: -80.83974495},
		{lat: 35.25706923, lng: -80.84088623},
		{lat: 35.24979435, lng: -80.84394925},
		{lat: 35.24377723, lng: -80.84895173},
		{lat: 35.23839277, lng: -80.85356973},
		{lat: 35.23142598, lng: -80.85895383},
		{lat: 35.22510146, lng: -80.86085912},
		{lat: 35.22354104, lng: -80.85466347},
		{lat: 35.21976883, lng: -80.84845858},
		{lat: 35.2153702, lng: -80.8403182},
		{lat: 35.21500806, lng: -80.83790693},
		{lat: 35.21934571, lng: -80.83326862},
		{lat: 35.2209114, lng: -80.83030877},
		{lat: 35.22368866, lng: -80.82735516},
		{lat: 35.22594548, lng: -80.82503415},
		{lat: 35.23199077, lng: -80.83058539},
		{lat: 35.23616481, lng: -80.82509001},
		{lat: 35.24068836, lng: -80.8191688},
		{lat: 35.24503976, lng: -80.81345572},
		{lat: 35.24852577, lng: -80.80752317},
		{lat: 35.25063716, lng: -80.7964828},
		{lat: 35.25257448, lng: -80.78543874},
		{lat: 35.25624763, lng: -80.77460742},
		{lat: 35.26216256, lng: -80.77164168},
		{lat: 35.26808012, lng: -80.76931158},
		{lat: 35.27469724, lng: -80.76740605},
		{lat: 35.28132026, lng: -80.76528555},
		{lat: 35.2844565, lng: -80.76550239},
		{lat: 35.28444174, lng: -80.77167986},
		{lat: 35.2840839, lng: -80.77551335},
		{lat: 35.28303151, lng: -80.77828011},
		{lat: 35.28074808, lng: -80.78572832},
		{lat: 35.27899232, lng: -80.79125941},
		{lat: 35.27705993, lng: -80.79785288},
		{lat: 35.27687927, lng: -80.80040684}
        ];

    var deliveryArea = new google.maps.Polygon({
            path: deliveryAreaCoordinates,
            strokeColor: '#FF0000',
            stokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35
        });

   deliveryArea.setMap(map);

    google.maps.event.addListener(map, 'click', function(e) {
    	var resultColor =
    	google.maps.geometry.poly.containsLocation(e.latLng, deliveryArea) ?
    	'red':
    	'black';

    var marker = new google.maps.Marker({
     position: markerPosition,
     map: map,
     title: address,
     icon: {
     	path: google.maps.SymbolPath.CIRCLE,
     	fillColor: resultColor,
     	fillOpacity: 1.0,
     	strokeColor: 'white',
     	strokeWeight: .5,
     	scale: 10
     }
    });
   });
 }

 google.maps.event.addDomListener(window, 'load', initialize);

});