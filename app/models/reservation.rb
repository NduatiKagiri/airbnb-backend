class Reservation < ApplicationRecord
  belongs_to :house
  belongs_to :user
  validates :date_in, presence: true
  validates :date_out, presence: true
end
