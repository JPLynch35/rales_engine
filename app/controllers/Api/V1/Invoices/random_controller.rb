class Api::V1::Invoices::RandomController < ApplicationController
  def show
    max = Invoice.count
    render json: Invoice.find(rand(1..max))
  end
end
