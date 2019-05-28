import mapboxgl from 'mapbox-gl';
import "bootstrap";

const mapElement = document.getElementById('map');

const addMarkers = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/mapbox/streets-v11'
      style: 'mapbox://styles/mapbox/satellite-streets-v10'
      // style: 'mapbox://styles/mapbox/light-v9'
      // style: 'mapbox://styles/mapbox/streets-v11'

    });

    map.addControl(new mapboxgl.NavigationControl());

    const markers = JSON.parse(mapElement.dataset.markers);
    fitMapToMarkers(map, markers);
    addMarkers(map, markers);
  }
};



export { initMapbox };
