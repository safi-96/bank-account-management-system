class Bank < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
