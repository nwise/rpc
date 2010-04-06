class Game < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  belongs_to :choice1, :class_name => "Choice"
  belongs_to :choice2, :class_name => "Choice"
  
  named_scope :available, :conditions =>  'choice2_id IS NULL'

  def winner
    #overly clever???
    choice1.weaknesses.include?(Weakness.find(choice2)) ? player2 : player1
  end
end
