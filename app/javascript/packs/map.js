require('mapbox-gl/dist/mapbox-gl.css')
require('@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css')
const mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapElement = document.getElementById('map');

if (mapElement) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = process.env.MAPBOX_API_KEY; // API key from `.env`
  const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v10'

  });

  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });

  const findBounds = (coordatinates) => {
  let longitudes = coordatinates.map(coordinate => coordinate.lng).sort((a, b) => a - b);
  let latitudes = coordatinates.map(coordinate => coordinate.lat).sort((a, b) => a - b);
  return [[longitudes[longitudes.length - 1], latitudes[latitudes.length - 1]], [longitudes[0], latitudes[0]]];
  };

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    bounds = findBounds(markers);
    map.fitBounds(bounds, {duration: 0, padding: 75});
  };


  markers.forEach((marker) => {
  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
    .setHTML(marker.infoWindow.content))
    .addTo(map);
  });
  addressInput = document.getElementById('teacher_address');

  if (addressInput) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: addressInput
    });
  }
}



