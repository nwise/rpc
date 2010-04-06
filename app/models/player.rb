class Player < ActiveRecord::Base
  acts_as_authentic
  named_scope :by_win_count, :order => "win_count DESC"
end
