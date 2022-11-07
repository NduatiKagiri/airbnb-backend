class User < ApplicationRecord
 has_many :houses, dependent: :destroy
end
