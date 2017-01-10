class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.boolean :address_type
      t.string :street_address1
      t.string :unit_number
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip

      t.timestamps

    end
  end
end
