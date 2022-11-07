class House < ApplicationRecord
  has_many :reservation
  validates :name, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
