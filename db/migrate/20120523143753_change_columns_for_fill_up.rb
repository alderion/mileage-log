class ChangeColumnsForFillUp < ActiveRecord::Migration
  def up
    change_column :fill_ups, :gallons, :decimal, :precision => 10, :scale => 3
    change_column :fill_ups, :cost_per_gallon, :decimal, :precision => 10, :scale => 3
    change_column :fill_ups, :mpg, :decimal, :precision => 10, :scale => 3
  end

  def down
  end
end
