class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :pts
      t.integer :fgm
      t.integer :fga
      t.integer :tpm
      t.integer :tpa
      t.integer :ftm
      t.integer :fta
      t.integer :reb
      t.integer :ast
      t.integer :stl
      t.integer :blk

      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
