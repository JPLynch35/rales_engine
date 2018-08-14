class Api::V1::Invoices::MerchantController < ApplicationController
  def index
    render json: Invoice.includes(:merchant).find(params[:invoice_id]).merchant, serializer: MerchantSerializer
  end
end