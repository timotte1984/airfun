class Attraction < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :nom, presence: true, allow_blank: false
  validates :attraction_type, presence: true, allow_blank: false
  validates :playersmax, presence: true

end
