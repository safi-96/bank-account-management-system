class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :bank

  validates :name, presence: true, uniqueness: true
end
