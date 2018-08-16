class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  default_scope -> {order(id: :asc)}

  def self.most_revenue(num_merchants)
    unscoped
    .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS sub_total')
    .joins(:invoices, invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.success)
    .group(:id)
    .order('sub_total DESC')
    .limit(num_merchants)
  end
end
