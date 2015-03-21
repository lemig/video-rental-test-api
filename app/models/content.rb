class Content < ActiveRecord::Base
  validates :title, presence: true
  validates :type, presence: true
  validates :quality, presence: true, :inclusion => { :in => ["SD", "HD"] }
  validates_numericality_of :price, greater_than_or_equal_to: 0.0
end
