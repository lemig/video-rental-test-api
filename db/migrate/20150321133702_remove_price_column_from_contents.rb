class RemovePriceColumnFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :price
  end
end
