class CreateChoicesWeaknesses < ActiveRecord::Migration
  def self.up
    create_table :choices_weaknesses, :id => false do |t|
      t.references :choice
      t.references :weakness      
      t.timestamps
    end
  end

  def self.down
    drop_table :choices_weaknesses
  end
end
