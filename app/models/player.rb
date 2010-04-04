class Player < ActiveRecord::Base
  acts_as_authentic

  #belongs_to :game, :foriegn_key => player1
  #belongs_to :game, :foriegn_key => player2
end
