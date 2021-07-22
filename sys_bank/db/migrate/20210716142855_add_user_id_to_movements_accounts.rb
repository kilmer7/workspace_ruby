class AddUserIdToMovementsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :movement_accounts, :user_id, :integer
  end
end
