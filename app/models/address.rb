class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :postcode
  validates_presence_of :line1, :postcode, :member_id
end
