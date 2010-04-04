class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :username
      t.string :email_address
      t.string :password
      t.integer :win_count

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
