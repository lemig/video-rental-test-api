class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :purchases, -> { order(created_at: :desc) }
end
