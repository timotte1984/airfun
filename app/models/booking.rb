class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :attraction_id
end
