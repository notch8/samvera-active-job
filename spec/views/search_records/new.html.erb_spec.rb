require 'rails_helper'

RSpec.describe "search_records/new", type: :view do
  before(:each) do
    assign(:search_record, SearchRecord.new(
      :pattern => "MyString",
      :count => 1,
      :users => "MyText"
    ))
  end

  it "renders new search_record form" do
    render

    assert_select "form[action=?][method=?]", search_records_path, "post" do

      assert_select "input[name=?]", "search_record[pattern]"

      assert_select "input[name=?]", "search_record[count]"

      assert_select "textarea[name=?]", "search_record[users]"
    end
  end
end
