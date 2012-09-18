class AddRemarksToMembers < ActiveRecord::Migration
  def change
    add_column :members, :remarks, :text
  end
end
