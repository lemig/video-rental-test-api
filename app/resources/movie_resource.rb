require 'jsonapi/resource'

class MovieResource < JSONAPI::Resource
  attributes :title, :plot, :created_at, :updated_at
end