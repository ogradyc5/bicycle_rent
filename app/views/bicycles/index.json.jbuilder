json.array!(@bicycles) do |bicycle|
  json.extract! bicycle, :id, :name, :description, :kind
  json.url bicycle_url(bicycle, format: :json)
end