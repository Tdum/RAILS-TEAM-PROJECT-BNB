class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :places, through: :bookings
  has_many :places
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :email, :encrypted_password, :first_name, :last_name, presence: true
validates :email, uniqueness: true


end
