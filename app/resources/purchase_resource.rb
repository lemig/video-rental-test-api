require 'jsonapi/resource'

class PurchaseResource < JSONAPI::Resource
  attributes :id, :price, :created_at, :updated_at

  has_one :user
  has_one :purchase_option

  filter :user
  filter :purchase_option

  def self.records(options = {})
    context = options[:context]
    context[:current_user].purchases
  end

  before_create :set_user

  def set_user
    puts self.inspect
    self.model.user_id = context[:current_user].id
  end
  # def self.find(filters, options = {})
  #   context = options[:context]
  #   purchases = context[:current_user].find_purchases(filters)

  #   return purchases.map do |purchase|
  #     self.new(purchase)
  #   end
  # end

  def self.find_by_key(key, options = {})
    context = options[:context]
    purchase = context[:current_user].purchases.where({_primary_key => key}).first
    if purchase.nil?
      raise JSONAPI::Exceptions::RecordNotFound.new(key)
    end
    self.new(purchase)
  end
end