class BankSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :accounts
  has_many :transactions
end
