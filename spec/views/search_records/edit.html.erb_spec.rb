require 'rails_helper'

RSpec.describe "search_records/edit", type: :view do
  before(:each) do
    @search_record = assign(:search_record, SearchRecord.create!(
      :pattern => "MyString",
      :count => 1,
      :users => "MyText"
    ))
  end

  it "renders the edit search_record form" do
    render

    assert_select "form[action=?][method=?]", search_record_path(@search_record), "post" do

      assert_select "input[name=?]", "search_record[pattern]"

      assert_select "input[name=?]", "search_record[count]"

      assert_select "textarea[name=?]", "search_record[users]"
    end
  end
end
