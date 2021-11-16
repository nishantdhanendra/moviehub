class Viewer < ApplicationRecord
  
  include JwtToken
# Direct associations

  # Indirect associations

  # Validations

  validates :movie_id, :uniqueness => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
