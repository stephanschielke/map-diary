json.array!(@google_kmls) do |google_kml|
  json.extract! google_kml, :id
  json.url google_kml_url(google_kml, format: :json)
end
