require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(
        :acronym => "Acronym",
        :logo => "Logo",
        :name => "Name",
        :website => "Website",
        :email => "Email",
        :description => "MyText",
        :description_source => "Description Source",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :instagram => "Instagram"
      ),
      Party.create!(
        :acronym => "Acronym",
        :logo => "Logo",
        :name => "Name",
        :website => "Website",
        :email => "Email",
        :description => "MyText",
        :description_source => "Description Source",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :instagram => "Instagram"
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "tr>td", :text => "Acronym".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Description Source".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
  end
end
