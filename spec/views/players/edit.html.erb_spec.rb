require 'spec_helper'

describe "/players/edit.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :new_record? => false,
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password",
      :win_count => 1
    )
  end

  it "renders the edit player form" do
    render

    response.should have_tag("form[action=#{player_path(@player)}][method=post]") do
      with_tag('input#player_username[name=?]', "player[username]")
      with_tag('input#player_email_address[name=?]', "player[email_address]")
      with_tag('input#player_password[name=?]', "player[password]")
      with_tag('input#player_win_count[name=?]', "player[win_count]")
    end
  end
end
