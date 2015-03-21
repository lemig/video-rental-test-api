class Content < ActiveRecord::Base
  validates :title, presence: true
  validates :type, presence: true

  has_many :purchase_options
end
