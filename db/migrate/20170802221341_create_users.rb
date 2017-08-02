class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :api_key
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone_number
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.boolean :activated
      t.integer :role

      t.timestamps
    end
  end
end
