class Member < ActiveRecord::Base
  attr_accessible :name, :ic_number, :doj, :donation, :phone, :family_members_attributes
  has_one :address, :validate => true
  has_many :family_members
  accepts_nested_attributes_for :family_members, :allow_destroy => true

  validates_presence_of :name, :ic_number, :doj, :donation, :address
  validates_uniqueness_of :ic_number
end
