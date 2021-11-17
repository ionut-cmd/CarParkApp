json.extract! reservation, :id, :bay_type, :vehicle_registration, :start_time, :duration, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
