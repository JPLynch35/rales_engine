class DailyRevenueSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :total_revenue

  def total_revenue
    number_to_currency(object / 100.00, unit: '', delimiter: '')
  end
end
