class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :sport, foreign_key: true
      t.string :opponent
      t.string :arena
      t.date :date

      t.timestamps
    end
  end
end
