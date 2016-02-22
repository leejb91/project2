class CreateGamesTeams < ActiveRecord::Migration
  def change
    create_table :games_teams do |t|
      t.references :game, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
