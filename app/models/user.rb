class User < ApplicationRecord
    has_one :click, dependent: :destroy
    has_many :image, dependent: :destroy
    has_secure_password
end
