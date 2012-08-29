class FamilyMember < ActiveRecord::Base
  attr_accessible :name
  belongs_to :member
end
