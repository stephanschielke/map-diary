# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  L.mapbox.accessToken = 'pk.eyJ1Ijoic3RlcGhzY2hpZSIsImEiOiJJa3VXWk9NIn0.150AUXe2kLvNeFGsunRabQ';

  mapboxTiles = L.tileLayer('https://{s}.tiles.mapbox.com/v3/stephschie.jmdpk5mm/{z}/{x}/{y}.png', {
      attribution: '<a href="http://www.mapbox.com/about/maps/" target="_blank">Terms &amp; Feedback</a>'
  });

  map = L.map('map').addLayer(mapboxTiles).setView([gon.lat, gon.lon], 15);
  
  marker = L.marker([gon.lat, gon.lon]).addTo(map);

  popup_html = 'Am: <b>' + gon.when + '</b>' + '<br />' +
               'Koordinaten: ' + gon.lat + ',' + gon.lon  

  marker.bindPopup(popup_html).openPopup();