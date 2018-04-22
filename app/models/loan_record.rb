class LoanRecord < ApplicationRecord
  belongs_to :user
  belongs_to :actor, class_name: 'User'


end
