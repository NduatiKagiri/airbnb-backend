json.extract! reservation, :id, :date_in, :date_out, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
