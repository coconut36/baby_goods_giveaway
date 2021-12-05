class Product < ApplicationRecord
  enum gender: {"boys"=>0, "girls"=>1, "unisex"=>2} 

  # Direct associations

  belongs_to :giver,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    giver.to_s
  end

end