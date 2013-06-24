# A Microposts adatbázis létrehozására szolgáló kód

class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      # Egy string típusú 'content'
      t.string :content
      # Valamint egy integer típusú 'user_id' oszlopunk lesz
      t.integer :user_id

      # Ez által generálódik le a 'created_at' és 'updated_at' oszlop
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end