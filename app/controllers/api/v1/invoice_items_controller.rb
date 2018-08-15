class Api::V1::InvoiceItemsController < ApplicationController
  def index
    if params[:invoice_id]
      render json: InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:item_id]
      render json: InvoiceItem.where(item_id: params[:item_id])
    end
  end
end
