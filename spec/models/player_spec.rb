require 'spec_helper'

describe Player do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password",
      :win_count => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end
end
