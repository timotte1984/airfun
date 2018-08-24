class Attraction < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :availabilities
  belongs_to :user
  validates :name, presence: true, allow_blank: false
  validates :attraction_type, presence: true, allow_blank: false
  validates :playersmax, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
