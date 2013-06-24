# Ez adja hozzá a password oszlopot a Users táblához

class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
