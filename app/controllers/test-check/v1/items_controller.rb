class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      render json: Merchant.includes(:items).find(params[:merchant_id]).items
    elsif params[:invoice_id]
      render json: Invoice.includes(:items).find(params[:invoice_id]).items
    else
      render json: Item.all
    end
  end

  def show
    if params[:invoice_item_id]
      render json: InvoiceItem.includes(:item).find(params[:invoice_item_id]).item
    else
      render json: Item.find(params[:id])
    end
  end
end
