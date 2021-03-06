require "open-uri"
class Product < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :image, ImageUploader

  enum gender: { "boys" => 0, "girls" => 1, "unisex" => 2 }

  # Direct associations

  belongs_to :age_group,
             class_name: "UserAge",
             foreign_key: "age_id"

  belongs_to :category

  has_many   :messages,
             dependent: :destroy

  belongs_to :giver,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    giver.to_s
  end
end
