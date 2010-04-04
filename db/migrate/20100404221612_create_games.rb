class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :player1
      t.integer :player2
      t.integer :choice1
      t.integer :choice2

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
