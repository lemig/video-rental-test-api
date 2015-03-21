class AddPurchaseOptionsToPurchase < ActiveRecord::Migration
  def change
    remove_column :purchases, :content_id
    add_reference :purchases, :purchase_option, index: true
    add_foreign_key :purchases, :purchase_options
  end
end
