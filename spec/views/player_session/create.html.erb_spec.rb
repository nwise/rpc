require 'spec_helper'

describe "/player_session/create" do
  before(:each) do
    render 'player_session/create'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/player_session/create])
  end
end
