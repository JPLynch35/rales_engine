class Api::V1::Invoices::CustomerController < ApplicationController
  def index
    render json: Invoice.includes(:customer).find(params[:invoice_id]).customer
  end
end
