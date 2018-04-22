class LoanRecordRequest < ApplicationRecord
  belongs_to :user
  belongs_to :initiator, class_name: 'User'

end
