require 'rails_helper'

RSpec.describe "search_records/show", type: :view do
  before(:each) do
    @search_record = assign(:search_record, SearchRecord.create!(
      :pattern => "Pattern",
      :count => 2,
      :users => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pattern/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
