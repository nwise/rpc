require 'spec_helper'

describe Game do
  before(:each) do
    @valid_attributes = {
      :player1 => 1,
      :player2 => 1,
      :choice1 => 1,
      :choice2 => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
