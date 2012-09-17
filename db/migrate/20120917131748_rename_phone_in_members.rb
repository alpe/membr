class RenamePhoneInMembers < ActiveRecord::Migration
  def up
    rename_column(:members, :phone, :hand_phone)
  end

  def down
    rename_column(:members, :hand_phone, :phone)
  end
end
