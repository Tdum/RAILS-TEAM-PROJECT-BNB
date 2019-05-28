import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const initMapbox = () => {

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
  }
};


// const initMapbox = () => {

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
//     const markers = JSON.parse(mapElement.dataset.markers);
//     markers.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([ marker.lng, marker.lat ])
//         .addTo(map);
//     });


//     map.on('load', function() {
// map.loadImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Cat_silhouette.svg/400px-Cat_silhouette.svg.png', function(error, image) {
// if (error) throw error;
// map.addImage('cat', image);
// map.addLayer({
// "id": "points",
// "type": "symbol",
// "source": {
// "type": "geojson",
// "data": {
// "type": "FeatureCollection",
// "features": [{
// "type": "Feature",
// "geometry": {
// "type": "Point",
// "coordinates": [0, 0]
// }
// }]
// }
// },
// "layout": {
// "icon-image": "cat",
// "icon-size": 0.25
// }
// });
// });
// });

//   }
// };


export { initMapbox };
