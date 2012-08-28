class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :postcode
      t.string :country
      t.references :member

      t.timestamps
    end
  end
end
