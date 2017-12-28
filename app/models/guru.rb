class Guru < ApplicationRecord
	has_secure_password
	validates :username, presence: true
	has_many :users
end
