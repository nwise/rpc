class Game < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  belongs_to :choice1, :class_name => "Choice"
  belongs_to :choice2, :class_name => "Choice"
  
  named_scope :available, :conditions =>  'choice2_id IS NULL'
  named_scope :completed, :conditions =>  'choice2_id IS NOT NULL'

  def winner
    if self.complete?
      choice1.weaknesses.include?(Weakness.find(choice2)) ? player2 : player1
    else
      nil
    end
  end

  def complete?
    !self.choice1.nil? and !self.choice2.nil?
  end
end
