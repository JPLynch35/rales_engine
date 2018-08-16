class Api::V1::InvoiceItemsController < ApplicationController
  def index
    if params[:invoice_id]
      render json: InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:item_id]
      render json: InvoiceItem.where(item_id: params[:item_id])
    else
      render json: InvoiceItem.all
    end
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end
end
