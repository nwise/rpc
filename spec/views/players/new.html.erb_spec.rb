require 'spec_helper'

describe "/players/new.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:player] = stub_model(Player,
      :new_record? => true,
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password",
      :win_count => 1
    )
  end

  it "renders new player form" do
    render

    response.should have_tag("form[action=?][method=post]", players_path) do
      with_tag("input#player_username[name=?]", "player[username]")
      with_tag("input#player_email_address[name=?]", "player[email_address]")
      with_tag("input#player_password[name=?]", "player[password]")
      with_tag("input#player_win_count[name=?]", "player[win_count]")
    end
  end
end
