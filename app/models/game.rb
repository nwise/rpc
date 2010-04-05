class Game < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  belongs_to :choice1, :class_name => "Choice"
  belongs_to :choice2, :class_name => "Choice"
  
  named_scope :available, :conditions =>  'choice2_id IS NULL'

  def winner
    self.choice1.weakness == self.choice2 ? self.player2 : self.player1
  end
end
