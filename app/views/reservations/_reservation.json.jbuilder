json.extract! reservation, :id, :type, :vehicle_registration, :start, :duration, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
