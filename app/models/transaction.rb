class Transaction < ApplicationRecord
  belongs_to :bank
  belongs_to :account

  validates :amount, :date, presence: true

  scope :duplicate_ids, -> { select('amount, group_concat(distinct transactions.id) as ids')
                             .group(:amount, :description)
                             .where("created_at >= ?", 1.minute.ago) }

  before_save :populate_duplicate_ids

  def populate_duplicate_ids
    duplicate_transactions = self.class.duplicate_ids.where(amount: amount)
    self.duplicate_ids = duplicate_transactions.pluck(:ids).first if duplicate_transactions.any?
  end
end
