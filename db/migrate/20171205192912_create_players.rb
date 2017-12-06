class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :league, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
