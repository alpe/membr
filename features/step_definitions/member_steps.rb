Given /^I chose to add a new member$/ do
  visit("/members/new")
end

Given /^I am on the members page$/ do
  visit("/")
end

Given /^a member exists$/ do
  @member = Member.find_by_name("Duana Stanley")
  @member.should_not be_nil 
end

When /^I add a new member with details:$/ do |table|
  @data = table.rows_hash
  [ :name, :ic_number, :doj, :donation, :hand_phone, :home_phone,
    :family_members_attributes_0_name,
    :family_members_attributes_1_name,
  ].each do |attr|
    fill_in("member_#{attr}", :with => @data[attr.to_s])
  end
  [ :line1, :line2, :postcode ].each do |attr|
    fill_in("address_#{attr}", :with => @data[attr.to_s])
  end
  click_button('Save')
end

Then /^I see a confirmation of the member's details$/ do
  @data.values.each do |value|
    page.should have_content(value)
  end
end

