class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_option

  validates_presence_of :user_id
  validates_presence_of :purchase_option_id

  before_save :store_purchase_option_price

  private

    def store_purchase_option_price
      self.price = purchase_option.price
    end
end
