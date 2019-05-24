class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :guests, :date, presence: true
end
