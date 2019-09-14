require 'rails_helper'

RSpec.describe "parties/show", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Acronym/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Description Source/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Instagram/)
  end
end
