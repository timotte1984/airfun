class User < ApplicationRecord
    has_many :bookings
    has_many :attractions
    has_many :attractions, through: :bookings
end
