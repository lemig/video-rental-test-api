require 'jsonapi/resource'

class ContentResource < JSONAPI::Resource
  attributes :title, :plot, :created_at, :updated_at, :content_type

  def content_type
    @model.type.downcase.pluralize
  end

  def self.apply_filter(records, filter, value)
    if filter == :content_type
      types = value.map(&:singularize).map(&:camelize)
      records.where(type: types)
    else
      super(records, filter, value)
    end
  end

  filter :content_type
end