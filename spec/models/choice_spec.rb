require 'spec_helper'

describe Choice do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :weakness_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Choice.create!(@valid_attributes)
  end
end
