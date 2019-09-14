require 'rails_helper'

RSpec.describe "parties/new", type: :view do
  before(:each) do
    assign(:party, Party.new(
      :acronym => "MyString",
      :logo => "MyString",
      :name => "MyString",
      :website => "MyString",
      :email => "MyString",
      :description => "MyText",
      :description_source => "MyString",
      :facebook => "MyString",
      :twitter => "MyString",
      :instagram => "MyString"
    ))
  end

  it "renders new party form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input[name=?]", "party[acronym]"

      assert_select "input[name=?]", "party[logo]"

      assert_select "input[name=?]", "party[name]"

      assert_select "input[name=?]", "party[website]"

      assert_select "input[name=?]", "party[email]"

      assert_select "textarea[name=?]", "party[description]"

      assert_select "input[name=?]", "party[description_source]"

      assert_select "input[name=?]", "party[facebook]"

      assert_select "input[name=?]", "party[twitter]"

      assert_select "input[name=?]", "party[instagram]"
    end
  end
end
