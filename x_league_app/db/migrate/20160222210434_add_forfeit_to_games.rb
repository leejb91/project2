class AddForfeitToGames < ActiveRecord::Migration
  def change
    add_column :games, :forfeit, :boolean, default: false
  end
end
