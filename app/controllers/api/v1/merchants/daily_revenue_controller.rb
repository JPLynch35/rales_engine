class Api::V1::Merchants::DailyRevenueController < ApplicationController
  def show
    render json: InvoiceItem.daily_revenue(params[:date]), serializer: DailyRevenueSerializer
  end
end
