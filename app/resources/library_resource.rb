require 'jsonapi/resource'

class LibraryResource < JSONAPI::Resource
  model_name 'Purchase'
  attributes :id, :title, :validity_in_seconds

  def title
    @model.content.title
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].purchases.active
  end

  filter :content_type
end