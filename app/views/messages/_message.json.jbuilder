json.extract! message, :id, :sender_id, :text, :product_id, :recipient_id,
              :created_at, :updated_at
json.url message_url(message, format: :json)
