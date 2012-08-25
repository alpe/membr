require 'spec_helper'

describe "members/new" do
  before(:each) do
    assign(:member, stub_model(Member,
      :firstname => "MyString",
      :lastname => "MyString",
      :ic_number => "MyString"
    ).as_new_record)
  end

  it "renders new member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path, :method => "post" do
      assert_select "input#member_firstname", :name => "member[firstname]"
      assert_select "input#member_lastname", :name => "member[lastname]"
      assert_select "input#member_ic_number", :name => "member[ic_number]"
    end
  end
end
