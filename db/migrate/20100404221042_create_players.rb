class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|

      t.string :username
      t.integer :win_count
      t.string :email_address
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
