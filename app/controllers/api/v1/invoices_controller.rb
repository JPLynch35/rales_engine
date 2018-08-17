class Api::V1::InvoicesController < ApplicationController
  def index
    if params[:merchant_id]
      render json: Merchant.includes(:invoices).find(params[:merchant_id]).invoices
    else
      render json: Invoice.all
    end
  end

  def show
    if params[:invoice_item_id]
      render json: InvoiceItem.includes(:invoice).find(params[:invoice_item_id]).invoice
    else
      render json: Invoice.find(params[:id])
    end
  end
end
