require 'jsonapi/resource'

class UserResource < JSONAPI::Resource
  attributes :email
end