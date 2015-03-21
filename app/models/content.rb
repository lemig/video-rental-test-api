class Content < ActiveRecord::Base
  validates :title, presence: true
  validates :type, presence: true
  validates :quality, presence: true, :inclusion => { :in => ["SD", "HD"] }
end
