class Post < ActiveRecord::Base
  attr_accessible :body, :name, :user_id

  belongs_to :user
  has_many :links
  has_many :post_shareds
  has_many :circles, through: :post_shared
  accepts_nested_attributes_for :links
end
