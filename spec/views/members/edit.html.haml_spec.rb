require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :firstname => "MyString",
      :lastname => "MyString",
      :ic_number => "MyString"
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path(@member), :method => "post" do
      assert_select "input#member_firstname", :name => "member[firstname]"
      assert_select "input#member_lastname", :name => "member[lastname]"
      assert_select "input#member_ic_number", :name => "member[ic_number]"
    end
  end
end
