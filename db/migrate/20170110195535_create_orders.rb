class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :country
      t.boolean :shipped

      t.timestamps

    end
  end
end
