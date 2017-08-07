class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :order_no
      t.string :sender_name
      t.string :sender_company
      t.string :sender_street_no
      t.string :sender_street1
      t.string :sender_street2
      t.string :sender_city
      t.string :sender_state
      t.string :sender_zip
      t.string :sender_country
      t.string :sender_phone
      t.string :sender_email
      t.string :recipient_name
      t.string :recipient_company
      t.string :recipient_street_no
      t.string :recipient_street1
      t.string :recipient_street2
      t.string :recipient_city
      t.string :recipient_state
      t.string :recipient_zip
      t.string :recipient_country
      t.string :recipient_phone
      t.string :recipient_email
      t.string :length
      t.string :width
      t.string :height
      t.string :state

      t.timestamps
    end

    add_index :orders, :order_no, unique: true
  end
end
