class Episode < Content
  belongs_to :season

  validates_numericality_of :number, only_integer: true, greater_than_or_equal_to: 0
  validates_presence_of :season_id
  validates_uniqueness_of :number, scope: :season_id

  default_scope { order(:number) }
end