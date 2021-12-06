class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :messages_received,
             resource: MessageResource,
             foreign_key: :recipient_id

  has_many   :messages_sent,
             resource: MessageResource,
             foreign_key: :sender_id

  has_many   :products,
             foreign_key: :giver_id

  # Indirect associations
end
