class CreateMovementAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :movement_accounts do |t|
      t.date :movement_date
      t.decimal :value
      t.integer :movement_type
      t.integer :account_id

      t.timestamps
    end
  end
end
