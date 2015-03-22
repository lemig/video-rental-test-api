require 'jsonapi/resource'

class SeasonResource < JSONAPI::Resource
  attributes :id, :title, :plot, :created_at, :updated_at

  has_many :episodes
end