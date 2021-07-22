class User < ActiveRecord::Base
  has_many :movement_accounts, class_name: 'MovementAccount'
  has_one :account, class_name: 'Account'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def transference
    #all_transfer_origin = movement_accounts.transfer.sum(:value).to_f
    #all_transfer_destiny = movement_accounts.transfer.sum(:value).to_f
    if movement_account.account_id != movement_account.account_destiny_id
      all_transfer_destiny = movement_accounts.limit - movement_accounts.value
    end
  end

  def value_total
    all_deposit = movement_accounts.deposit.sum(:value).to_f
    all_bank_draft = movement_accounts.bank_draft.sum(:value).to_f
    all_reversal = movement_accounts.reversal.sum(:value).to_f
    all_transfer_origin = movement_accounts.transfer.sum(:value).to_f
    all_transfer_destiny = MovementAccount.transfer.where(account_destiny_id: self.account.try(:id)).sum(:value).to_f
    #current_value = Account.where(user: self).sum(:limit).to_f
    current_value = account.try(:limit).to_f

    (current_value + all_deposit - all_bank_draft + all_reversal - all_transfer_origin + all_transfer_destiny).to_f
  end
end
