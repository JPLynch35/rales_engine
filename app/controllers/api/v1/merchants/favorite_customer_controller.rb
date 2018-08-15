class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    render json: Customer.fav_customer(params[:merchant_id])
  end
end
