require 'spec_helper'

describe "/games/index.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:games] = [
      stub_model(Game,
        :player1 => 1,
        :player2 => 1,
        :choice1 => 1,
        :choice2 => 1
      ),
      stub_model(Game,
        :player1 => 1,
        :player2 => 1,
        :choice1 => 1,
        :choice2 => 1
      )
    ]
  end

  it "renders a list of games" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
