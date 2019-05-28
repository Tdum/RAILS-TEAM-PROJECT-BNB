class Place < ApplicationRecord

  CATEGORIES = ["Dream views", "loud friendly", "Fashionable", "Hypster", "Home sweet home"]
  belongs_to :user
  has_many :bookings
  validates :name, :address, :description, :guest_capacity, :price, presence: true
  validates :party_type, inclusion: { in: CATEGORIES }
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
