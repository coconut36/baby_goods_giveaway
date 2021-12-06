class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :messages_received,
             class_name: "Message",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :messages_sent,
             class_name: "Message",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :products,
             foreign_key: "giver_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
