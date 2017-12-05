class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :player, foreign_key: true
      t.integer :score 

      t.timestamps
    end
  end
end
