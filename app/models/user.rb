class User < ApplicationRecord
  has_secure_password
  belongs_to :admin, required: false
  belongs_to :guru, required: false
  belongs_to :pengasuhan, required: false
  belongs_to :santri, required: false
end
