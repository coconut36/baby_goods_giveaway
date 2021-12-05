class UserAge < ApplicationRecord
  # Direct associations

  has_many   :products,
             :foreign_key => "age_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    age_range
  end

end
