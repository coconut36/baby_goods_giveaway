json.extract! product, :id, :giver_id, :name, :description, :age_id, :category_id, :gender, :image, :location, :created_at, :updated_at
json.url product_url(product, format: :json)
