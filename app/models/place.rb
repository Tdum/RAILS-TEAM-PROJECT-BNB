class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :address, :description, :guest_capacity, :price, presence: true
  mount_uploaders :photos, PhotoUploader
end
