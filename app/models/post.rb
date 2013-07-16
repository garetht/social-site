class Post < ActiveRecord::Base
  attr_accessible :body, :name, :user_id, :circle_ids, :links_attributes

  belongs_to :user
  has_many :links
  has_many :post_shares
  has_many :circles, through: :post_shares
  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
