class AddColumnToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :rando, :string
  end
end
