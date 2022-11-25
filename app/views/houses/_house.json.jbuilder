json.extract! house, :id, :name, :photo, :price, :location, :created_at, :updated_at
json.url house_url(house, format: :json)
