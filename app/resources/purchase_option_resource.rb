require 'jsonapi/resource'

class PurchaseOptionResource < JSONAPI::Resource
  attributes :id, :price, :quality, :created_at, :updated_at

  has_one :content

  filter :content
end