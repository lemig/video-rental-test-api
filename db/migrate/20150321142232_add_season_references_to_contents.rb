class AddSeasonReferencesToContents < ActiveRecord::Migration
  def change
    add_reference :contents, :season, index: true
    add_foreign_key :contents, :seasons
  end
end
