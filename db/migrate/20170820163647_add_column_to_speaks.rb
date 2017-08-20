class AddColumnToSpeaks < ActiveRecord::Migration[5.1]
  def change
    add_reference :speaks, :room, foreign_key: true
  end
end
