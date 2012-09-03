require 'spec_helper'

describe "members/new" do
  let(:member) { Member.new }
  before do
    member.build_address
    assign(:member, member)
  end

  it "contains 5 input fields for family members" do
    render

    5.times do |i|
      assert_select "#member_family_members_attributes_#{i}_name"
    end
  end

  it "has 5 family member fields including previously entered ones like after validation error" do
    member.family_members.build(:name => "Gerald")

    render
    #puts  response_from_page
    assert_select "#member_family_members_attributes_0_name[value=Gerald]"
    4.times do |i|
      assert_select "#member_family_members_attributes_#{i+1}_name"
    end
  end
end
