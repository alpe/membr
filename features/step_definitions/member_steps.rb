Given /^I chose to add a new member$/ do
  visit("/members/new")
end

When /^I add a new member with details:$/ do |table|
  @data = table.rows_hash
  fill_in('member_firstname', :with => @data['firstname'])
  fill_in('member_lastname', :with => @data['lastname'])
  fill_in('member_ic_number', :with => @data['ic_number'])
  click_button('Save')
end

Then /^I see a confirmation of the member's details$/ do
  page.should have_content(@data['firstname'])
  page.should have_content(@data['lastname'])
  page.should have_content(@data['ic_number'])
end
