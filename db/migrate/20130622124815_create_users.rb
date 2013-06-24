#A Users tábla létrehozásához használt kód

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # Egy string típusú név
      t.string :name
      # És egy szintén string típusú email
      t.string :email

      # Ez pedig a created_at és updated_at oszlopokat adja hozzá az adatbázishoz
      t.timestamps
    end
  end
end
