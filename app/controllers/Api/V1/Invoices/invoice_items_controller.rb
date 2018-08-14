class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    render json: Invoice.includes(:invoice_items).find(params[:invoice_id]).invoice_items
    # render json: InvoiceItem.where(invoice_id: params[:invoice_id])
  end
end
