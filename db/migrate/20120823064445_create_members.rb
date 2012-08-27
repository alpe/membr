class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.date :doj
      t.string :ic_number
      t.integer :donation
      t.string :phone
      t.timestamps
    end
  end
end
