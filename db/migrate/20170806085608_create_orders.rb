class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :sender_name
      t.string :sender_address
      t.string :state

      t.timestamps
    end
  end
end
