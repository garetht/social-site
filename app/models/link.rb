class Link < ActiveRecord::Base
  attr_accessible :name, :post_id, :url

  belongs_to :post
  before_save :set_name

  validates :url, presence: true

  def set_name
    self.name = self.url if name.blank?
  end

end
