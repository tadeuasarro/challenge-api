class AddCitizenIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :citizen_id, :integer
  end
end
