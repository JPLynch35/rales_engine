class ItemSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id, :name, :description, :merchant_id, :unit_price

  def unit_price
    number_to_currency(object.unit_price / 100.00, unit: '')
  end
end
