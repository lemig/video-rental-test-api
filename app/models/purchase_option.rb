class PurchaseOption < ActiveRecord::Base
  belongs_to :content
  has_many :purchases
  
  validates :quality, presence: true, :inclusion => { :in => ["SD", "HD"] }
  validates :content_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }
end
