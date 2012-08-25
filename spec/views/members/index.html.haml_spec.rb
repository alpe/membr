require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :ic_number => "Ic Number"
      ),
      stub_model(Member,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :ic_number => "Ic Number"
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Ic Number".to_s, :count => 2
  end
end
