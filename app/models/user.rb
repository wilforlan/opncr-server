class User < ApplicationRecord
  has_many :loan_record,  dependent: :destroy
  has_many :loan_record_requests

  validates :address, presence: true
  validates_uniqueness_of :address

end
