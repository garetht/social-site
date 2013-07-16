class Circleship < ActiveRecord::Base
  attr_accessible :circle_id, :user_id

  belongs_to :circle
  belongs_to :friend, foreign_key: :user_id, class_name: "User"

end
