class ProductResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :giver_id, :integer
  attribute :name, :string
  attribute :description, :string
  attribute :age_id, :integer
  attribute :category_id, :integer
  attribute :gender, :string_enum, allow: Product.genders.keys
  attribute :image, :string
  attribute :location, :string

  # Direct associations

  belongs_to :age_group,
             resource: UserAgeResource,
             foreign_key: :age_id

  belongs_to :category

  belongs_to :giver,
             resource: UserResource

  # Indirect associations
end
