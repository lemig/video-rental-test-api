class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :content

  validates_numericality_of :price, greater_than_or_equal_to: 0.0
  validates_presence_of :user_id
  validates_presence_of :content_id
end
