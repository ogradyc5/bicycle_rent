json.array!(@rentals) do |rental|
  json.extract! rental, :id, :starts_on, :ends_on, :bicycle
  json.url rental_url(rental, format: :json)
end