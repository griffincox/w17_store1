class CreateItemphotos < ActiveRecord::Migration
  def change
    create_table :itemphotos do |t|
      t.integer :item_id
      t.string :image

      t.timestamps

    end
  end
end
