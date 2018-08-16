class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :merchant_id
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> {order(id: :asc)}

  def self.most_revenue(num_items)
    unscoped
    .select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .joins(:invoices)
    .group(:id)
    .order('revenue DESC')
    .limit(num_items)
  end
end
