class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.string :ic_number

      t.timestamps
    end
  end
end
