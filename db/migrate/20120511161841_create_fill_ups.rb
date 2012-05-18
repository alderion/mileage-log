class CreateFillUps < ActiveRecord::Migration
  def change
    create_table :fill_ups do |t|
      t.integer :vehicle_id
      t.date :fill_date
      t.integer :odometer
      t.decimal :gallons, :precision => 10, :scale => 2
      t.decimal :cost_per_gallon, :precision => 10, :scale => 2
      t.decimal :mpg, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end