class Review < ApplicationRecord
  belongs_to :place
  validates :content, length: { minimum: 20 }
  validates :number, :inclusion => 0..5
end
