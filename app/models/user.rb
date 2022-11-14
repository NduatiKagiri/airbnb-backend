class User < ApplicationRecord
  has_many :houses, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
