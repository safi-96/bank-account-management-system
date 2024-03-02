class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :bank
  has_many :transactions
end
