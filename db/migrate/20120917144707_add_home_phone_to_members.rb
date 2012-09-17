class AddHomePhoneToMembers < ActiveRecord::Migration
  def change
    add_column :members, :home_phone, :string
  end
end
