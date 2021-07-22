class Account < ApplicationRecord
    belongs_to :agency, class_name: 'Agency'
    belongs_to :user, class_name: 'User'
   
end
