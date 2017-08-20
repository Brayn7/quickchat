class CreateLoginPages < ActiveRecord::Migration[5.1]
  def change
    create_table :login_pages do |t|

      t.timestamps
    end
  end
end
