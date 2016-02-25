class AddFavoriteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite, :integer
  end
end
