class Member < ActiveRecord::Base
  attr_accessible :name, :ic_number, :doj, :donation, :phone
  has_one :address
end
