class InvoiceItem < ApplicationRecord
  validates_presence_of :item_id, :invoice_id, :quantity, :unit_price
  belongs_to :invoice
  belongs_to :item

  default_scope -> {order(id: :asc)}

  def self.daily_revenue(date)
    joins(invoice: :transactions)
    .merge(Transaction.unscoped.success)
    .where('invoices.created_at::date = ?', date)
    .pluck('invoice_items.quantity * invoice_items.unit_price')
    .sum
  end
end
