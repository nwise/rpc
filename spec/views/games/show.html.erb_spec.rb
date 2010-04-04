require 'spec_helper'

describe "/games/show.html.erb" do
  include GamesHelper
  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :player1 => 1,
      :player2 => 1,
      :choice1 => 1,
      :choice2 => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
