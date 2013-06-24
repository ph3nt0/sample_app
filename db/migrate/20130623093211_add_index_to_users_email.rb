#Az egyedi index-eket adja hozzá a Users táblához

class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  end
end
