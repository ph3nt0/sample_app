#Az admin lehetőségének hozzáadása a Users táblához

class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end