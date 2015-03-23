class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :purchases, -> { order(created_at: :desc) }
  has_many :purchase_options, through: :purchases

  before_create :set_auth_token

  def active_purchases
    purchases.active
  end

  def active_purchase_options
    active_purchases.includes(:purchase_option).map(&:purchase_option)
  end

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generate_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end
