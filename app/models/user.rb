class User < ActiveRecord::Base
  attr_accessible :session_token, :username, :password, :password_confirmation
  has_secure_password

  has_many :circles #as owner

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
