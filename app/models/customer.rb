class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  default_scope -> {order(id: :asc)}

  def self.fav_customer(merch_id)
    unscoped
    .select('customers.*, count(transactions.id) AS transaction_count')
    .joins(:transactions)
    .merge(Transaction.unscoped.success)
    .where(invoices: {merchant_id: merch_id})
    .group(:id)
    .order('transaction_count desc')
    .limit(1)
    .first
  end
end
