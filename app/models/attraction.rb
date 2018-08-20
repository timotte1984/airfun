class Attraction < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, allow_blank: false
  validates :type, presence: true, allow_blank: false
  validates :playersmax, presence: true, :inclusion => {:in => [1,99]}

end
