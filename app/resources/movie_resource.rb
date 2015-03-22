require 'jsonapi/resource'

class MovieResource < JSONAPI::Resource
  attributes :id, :title, :plot, :created_at, :updated_at
end