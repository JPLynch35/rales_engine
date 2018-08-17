class Api::V1::Merchants::CustomersPendingInvoicesController < ApplicationController
  def index
    render json: Customer.pending_invoices(params[:merchant_id])
  end
end
