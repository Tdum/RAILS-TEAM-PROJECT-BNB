class Review < ApplicationRecord
  belongs_to :place
  validates :content, length: { minimum: 20 }
  validates :note, :inclusion => 0..5
end
