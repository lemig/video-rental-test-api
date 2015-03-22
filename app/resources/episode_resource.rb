require 'jsonapi/resource'

class EpisodeResource < JSONAPI::Resource
  attributes :id, :number, :title, :plot, :created_at, :updated_at
end