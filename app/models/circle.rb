class Circle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friend_ids

  belongs_to :user #as owner
  has_many :circleships
  has_many :friends, class_name: "User", through: :circleships

  validates :name, :user, presence: true
  validates :name, uniqueness: {scope: :user_id, case_sensitive: false}
end
