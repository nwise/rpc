class Player < ActiveRecord::Base
  acts_as_authentic
  named_scope :by_win_count, :order => "win_count DESC"

  def increment_wins
    self.win_count += 1
    save
  end
end
