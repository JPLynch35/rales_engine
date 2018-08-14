class Api::V1::InvoicesController < ApplicationController
  def index
    render json: Invoice.all, each_serializer: InvoiceSerializer
  end

  def show
    render json: Invoice.find(params[:id]), serializer: InvoiceSerializer
  end
end
