json.extract! product, :id, :weight, :length, :width, :height, :departure, :destination, :created_at, :updated_at
json.url product_url(product, format: :json)
