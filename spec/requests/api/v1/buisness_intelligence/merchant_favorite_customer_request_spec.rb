require 'rails_helper'

describe 'Business Intelligence API' do
  context 'GET /api/v1/merchants/:id/favorite_customer' do
    it 'returns the customer who has conducted the most total number of successful transactions' do
      merchant1 = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer, first_name: 'Bill')
      customer3 = create(:customer)
      invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
      invoice3 = create(:invoice, customer: customer2, merchant: merchant1)
      invoice4 = create(:invoice, customer: customer3, merchant: merchant1)
      transaction1 = create(:transaction, invoice: invoice1, result: 'failed')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice2, result: 'success')
      transaction4 = create(:transaction, invoice: invoice3, result: 'success')

      get "/api/v1/merchants/#{merchant1.id}/favorite_customer"

      expect(response).to be_successful

      fav_customer = JSON.parse(response.body, symbolize_names: true)

      expect(fav_customer[:first_name]).to eq('Bill')
      expect(fav_customer[:id]).to eq(2)
    end
  end
end
