class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :room
      t.string :owner

      t.timestamps
    end
  end
end
