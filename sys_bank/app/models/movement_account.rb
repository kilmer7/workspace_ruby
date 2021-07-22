class MovementAccount < ApplicationRecord
    belongs_to :account, class_name: 'Account'
    belongs_to :account_destiny, class_name: 'Account', foreign_key: "account_destiny_id", optional: true
    belongs_to :user, class_name: 'User'

    validates :account_destiny_id, presence: true, if: :transfer?
    validate :users_transfer_validate, if: :transfer?
    validate :value_validate
    validates :value, presence: true

    enum movement_type:{
        bank_draft: 0,
        deposit: 1,
        reversal: 2,
        transfer: 3
    }

    def users_transfer_validate
        if self.account_id == self.account_destiny_id
            errors.add(:account_id, "can't same.")
        end
    end

    def value_validate
        if self.account.limit < self.value 
            errors.add(:value, "greater than limit.")
        end
    end

end

