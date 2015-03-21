require 'jsonapi/resource'

class EpisodeResource < JSONAPI::Resource
  attributes :number, :title, :plot, :created_at, :updated_at

  has_one :season
end