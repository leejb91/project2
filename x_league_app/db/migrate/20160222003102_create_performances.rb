class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :pts, :default => 0
      t.integer :fgm, :default => 0
      t.integer :fga, :default => 0
      t.integer :tpm, :default => 0
      t.integer :tpa, :default => 0
      t.integer :ftm, :default => 0
      t.integer :fta, :default => 0
      t.integer :reb, :default => 0
      t.integer :ast, :default => 0
      t.integer :stl, :default => 0
      t.integer :blk, :default => 0

      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
