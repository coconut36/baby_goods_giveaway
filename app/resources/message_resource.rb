class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :text, :string
  attribute :product_id, :integer
  attribute :recipient_id, :integer

  # Direct associations

  belongs_to :product

  belongs_to :recipient,
             resource: UserResource

  belongs_to :sender,
             resource: UserResource

  # Indirect associations
end
