class Api::V1::InvoicesController < ApplicationController
  def index
    render json: Invoice.all
  end

  def show
    if params[:invoice_item_id]
      render json: InvoiceItem.includes(:invoice).find(params[:invoice_item_id]).invoice
    else
      render json: Invoice.find(params[:id])
    end
  end
end
