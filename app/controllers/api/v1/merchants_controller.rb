class Api::V1::MerchantsController < ApplicationController
  def index
    if params[:invoice_id]
      render json: Invoice.includes(:merchant).find(params[:invoice_id]).merchant
    else
      render json: Merchant.all
    end
  end

  def show
    render json: Merchant.find(params[:id])
  end
end
