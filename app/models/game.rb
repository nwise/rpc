class Game < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  belongs_to :choice1, :class_name => "Choice"
  belongs_to :choice2, :class_name => "Choice"
  after_save :update_player_wins

  default_scope :order => 'updated_at DESC'

  named_scope :available, 
              :conditions =>  'choice2_id IS NULL'

  named_scope :without_player,
              lambda{|player| {:conditions => "player1_id <> #{player.id} OR player2_id <> #{player.id}"}}
            
  named_scope :completed, :conditions =>  'choice2_id IS NOT NULL'

  def winner
    if winner?
      choice1.weaknesses.include?(Weakness.find(choice2)) ? player2 : player1
    else
      nil
    end
  end
  
  def winner?
    not tied? and complete?
  end
  # TODO - look at creating GameStatus and calling the methods below
  # on after_save callback to hold result in DB instead of calculating
  # it on the fly. 

  #Both players have selected the same choice; no winner.
  def tied?
    self.choice1 == self.choice2
  end

  #Both players have submited entries
  def complete?
    !self.choice1.nil? and !self.choice2.nil?
  end

  #Game has two players but incomplete entries
  def in_progress?
    !self.player2.nil? and self.choice2.nil?
  end

  private
  def update_player_wins
    if winner?
      self.winner.increment_wins
    end
  end
end
