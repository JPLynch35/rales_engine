class InvoiceItem < ApplicationRecord
  validates_presence_of :item_id, :invoice_id, :quantity, :unit_price
  belongs_to :invoice
  belongs_to :item

  default_scope -> {order(id: :asc)}

  def self.daily_revenue(date)
    # merge(Transaction.unscoped.success)
    where('invoice_items.created_at = ?', date.to_datetime)
    .pluck('invoice_items.quantity * invoice_items.unit_price')
    .sum
  end
end
