class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true
      t.references :content, index: true
      t.decimal :price

      t.timestamps null: false
    end
    add_foreign_key :purchases, :users
    add_foreign_key :purchases, :contents
  end
end
