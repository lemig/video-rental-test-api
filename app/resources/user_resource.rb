require 'jsonapi/resource'

class UserResource < JSONAPI::Resource
  attributes :id, :email
  has_many :purchases
end