class UserAgeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :age_range, :string

  # Direct associations

  has_many   :products,
             foreign_key: :age_id

  # Indirect associations

end
