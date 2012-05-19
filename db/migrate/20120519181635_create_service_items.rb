class CreateServiceItems < ActiveRecord::Migration
  def change
    create_table :service_items do |t|
      t.integer :odometer
      t.string :item_desc
      t.boolean :completed
      t.boolean :triggered
      t.references :vehicle

      t.timestamps
    end
    add_index :service_items, :vehicle_id
  end
end
