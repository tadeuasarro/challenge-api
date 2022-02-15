class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.bigint :cpf
      t.bigint :cns
      t.string :email
      t.timestamp :birth_date
      t.bigint :phone
      t.string :picture
      t.integer :status

      t.timestamps
    end
  end
end
