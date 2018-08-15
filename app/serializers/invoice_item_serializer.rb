class InvoiceItemSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price

  def unit_price
    number_to_currency(object.unit_price / 100.00, unit: '')
  end
end
