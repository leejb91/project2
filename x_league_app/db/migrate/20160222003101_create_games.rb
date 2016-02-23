class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_number
      t.date :date
      t.integer :home_id, index: true
      t.integer :away_id, index: true

      t.timestamps null: false
    end
  end
end
