class CreateSpeaks < ActiveRecord::Migration[5.1]
  def change
    create_table :speaks do |t|
      t.string :content
      t.string :user

      t.timestamps
    end
  end
end
