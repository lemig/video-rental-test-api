class Movie < Content
  default_scope { order(:created_at) }
end