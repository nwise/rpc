require 'spec_helper'

describe "/players/show.html.erb" do
  include PlayersHelper
  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password",
      :win_count => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ email_address/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/1/)
  end
end
