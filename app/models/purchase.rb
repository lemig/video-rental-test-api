class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_option

  validates_numericality_of :price, greater_than_or_equal_to: 0.0
  validates_presence_of :user_id
  validates_presence_of :purchase_option_id
end
