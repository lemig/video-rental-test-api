class Season < Content
  has_many :episodes, -> { order('number') }
end