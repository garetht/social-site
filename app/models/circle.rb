class Circle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friend_ids

  belongs_to :user #as owner
  has_many :circleships
  has_many :friends, class_name: "User", through: :circleships
  has_many :post_shares
  has_many :posts, through: :post_shares

  validates :name, :user, presence: true
  validates :name, uniqueness: {scope: :user_id, case_sensitive: false}
end
