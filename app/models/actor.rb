class Actor < ApplicationRecord
  has_many :loan_record

  validates :signing_key, presence: true
  validates_uniqueness_of :signing_key
  
  validates :address, presence: true
  validates_uniqueness_of :address


end
