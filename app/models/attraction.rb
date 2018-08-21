class Attraction < ApplicationRecord
  has_many :bookings
  validates :name, presence: true, allow_blank: false
  validates :attraction_type, presence: true, allow_blank: false
  validates :playersmax, presence: true

end
