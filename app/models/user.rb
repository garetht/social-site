class User < ActiveRecord::Base
  attr_accessible :session_token, :username, :password, :password_confirmation,
                  :posts_attributes
  has_secure_password

  has_many :circles #as owner
  has_many :circleships
  has_many :sectors, through: :circleships, source: :circle
  has_many :posts
  accepts_nested_attributes_for :posts, reject_if: :all_blank

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
