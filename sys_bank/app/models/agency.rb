class Agency < ApplicationRecord
    has_many :accounts, class_name: 'Account'

    def agency_num_and_name
        num_agency + ' - ' + adress
    end
end
