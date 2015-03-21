require 'jsonapi/resource'

class SeasonResource < JSONAPI::Resource
  attributes :title, :plot, :created_at, :updated_at

  has_many :episodes
end