class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode
      t.string :street
      t.string :second_line
      t.string :district
      t.string :city
      t.string :state
      t.integer :ibge

      t.timestamps
    end
  end
end
