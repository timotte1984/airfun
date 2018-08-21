class Attraction < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true, allow_blank: false
  validates :attraction_type, presence: true, allow_blank: false
  validates :playersmax, presence: true
  mount_uploader :photo, PhotoUploader
end
