class AddNoteToFillUps < ActiveRecord::Migration
  def change
    add_column :fill_ups, :note, :string
  end
end
