class AddCamposToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :limit, :integer
  end
end
