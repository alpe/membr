class FamilyMember < ActiveRecord::Base
  attr_accessible :name
  belongs_to :member
  validates :name, :presence => true
end
