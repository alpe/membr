class Member < ActiveRecord::Base
  attr_accessible :name, :ic_number, :doj, :donation, :phone, :family_members_attributes
  has_one :address
  has_many :family_members
  accepts_nested_attributes_for :family_members, :allow_destroy => true
end
