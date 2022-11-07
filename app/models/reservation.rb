class Reservation < ApplicationRecord
  belongs_to :house
  validates :date_in, presence: true
  validates :date_out, presence: true
end
