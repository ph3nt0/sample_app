# Ez a kód hozza létre a Relationship adatbázist

class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      # Egy integer típusú follower_id
      t.integer :follower_id
      # És egy szintén integer típusú followed_id oszloppal
      t.integer :followed_id

      # Valamint ehhez a táblához is szükségünk van a created_at és updated_at oszlopokra
      t.timestamps
    end

    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end