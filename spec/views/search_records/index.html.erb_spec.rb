require 'rails_helper'

RSpec.describe "search_records/index", type: :view do
  before(:each) do
    assign(:search_records, [
      SearchRecord.create!(
        :pattern => "Pattern",
        :count => 2,
        :users => "MyText"
      ),
      SearchRecord.create!(
        :pattern => "Pattern",
        :count => 2,
        :users => "MyText"
      )
    ])
  end

  it "renders a list of search_records" do
    render
    assert_select "tr>td", :text => "Pattern".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
