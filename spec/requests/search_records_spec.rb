require 'rails_helper'

RSpec.describe "SearchRecords", type: :request do
  describe "GET /search_records" do
    it "works! (now write some real specs)" do
      get search_records_path
      expect(response).to have_http_status(200)
    end
  end
end
