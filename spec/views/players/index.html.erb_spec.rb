require 'spec_helper'

describe "/players/index.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:players] = [
      stub_model(Player,
        :username => "value for username",
        :email_address => "value for email_address",
        :password => "value for password",
        :win_count => 1
      ),
      stub_model(Player,
        :username => "value for username",
        :email_address => "value for email_address",
        :password => "value for password",
        :win_count => 1
      )
    ]
  end

  it "renders a list of players" do
    render
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for email_address".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
