class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    if params[:invoice_id]
      render json: Invoice.includes(:merchant).find(params[:invoice_id]).merchant
    elsif params[:item_id]
      render json: Item.includes(:merchant).find(params[:item_id]).merchant
    else
      render json: Merchant.find(params[:id])
    end
  end
end
