class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.string :quality
      t.decimal :price
      t.references :content, index: true

      t.timestamps null: false
    end
    add_foreign_key :purchase_options, :contents
  end
end
