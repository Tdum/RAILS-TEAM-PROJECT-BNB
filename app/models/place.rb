class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploaders :photos, PhotoUploader
  serialize :avatars, JSON # If you use SQLite, add this line.

end
