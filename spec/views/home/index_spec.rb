require 'rails_helper'

RSpec.describe "home/index", type: :view do
  it "displays the welcome heading" do
    render

    expect(rendered).to include("Welcome to Silver FriendAPP")
  end
end
