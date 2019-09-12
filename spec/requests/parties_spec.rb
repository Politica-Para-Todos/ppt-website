require 'rails_helper'

RSpec.describe "Parties", type: :request do
  describe "GET /parties" do
    it "works! (now write some real specs)" do
      get parties_path
      expect(response).to have_http_status(200)
    end
  end
end
