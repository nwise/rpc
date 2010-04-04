require 'spec_helper'

describe "/games/edit.html.erb" do
  include GamesHelper

  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :new_record? => false,
      :player1 => 1,
      :player2 => 1,
      :choice1 => 1,
      :choice2 => 1
    )
  end

  it "renders the edit game form" do
    render

    response.should have_tag("form[action=#{game_path(@game)}][method=post]") do
      with_tag('input#game_player1[name=?]', "game[player1]")
      with_tag('input#game_player2[name=?]', "game[player2]")
      with_tag('input#game_choice1[name=?]', "game[choice1]")
      with_tag('input#game_choice2[name=?]', "game[choice2]")
    end
  end
end
