class AddFieldToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :num_account, :string
  end
end
