class AddAccountDestinyToMovementAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :movement_accounts, :account_destiny_id, :integer
  end
end
