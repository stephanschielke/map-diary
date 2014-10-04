json.array!(@gps_coords) do |gps_coord|
  json.extract! gps_coord, :id, :when, :longitude, :latitude, :altitude
  json.url gps_coord_url(gps_coord, format: :json)
end
