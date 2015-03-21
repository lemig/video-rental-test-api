class RemoveQualityFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :quality
  end
end
