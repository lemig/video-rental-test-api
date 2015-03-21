class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :type
      t.string :quality
      t.decimal :price, default: 2.99, precision: 6, scale: 2
      t.string :title
      t.text :plot

      t.timestamps null: false
    end
  end
end
