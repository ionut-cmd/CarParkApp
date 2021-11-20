json.extract! carpark, :id, :location, :available, :total, :green, :disabled, :created_at, :updated_at
json.url carpark_url(carpark, format: :json)
