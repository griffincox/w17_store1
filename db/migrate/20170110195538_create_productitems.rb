class CreateProductitems < ActiveRecord::Migration
  def change
    create_table :productitems do |t|
      t.integer :cart_id
      t.integer :order_id
      t.integer :item_id

      t.timestamps

    end
  end
end
