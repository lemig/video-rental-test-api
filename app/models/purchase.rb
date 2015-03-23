class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_option

  validates_presence_of :user_id
  validates_presence_of :purchase_option_id

  before_save :check_not_active_purchase_option
  before_save :store_purchase_option_price

  VALIDITY = 2.days

  default_scope -> { order("created_at") }
  scope :active, -> { where(["created_at > ?", VALIDITY.ago]) }

  def active?
    created_at > VALIDITY.ago
  end

  def validity_in_seconds
    (created_at + VALIDITY - Time.now).round
  end

  def content
    purchase_option.content
  end

  private
    def check_not_active_purchase_option
      if user.active_purchase_options.include? purchase_option
        errors.add(:purchase_option, 'is already active')
        false
      end
    end

    def store_purchase_option_price
      self.price = purchase_option.price
    end
end
