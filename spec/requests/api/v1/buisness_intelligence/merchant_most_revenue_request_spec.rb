require 'rails_helper'

describe 'Business Intelligence API' do
  context 'GET /api/v1/merchants/most_revenue?quantity=x' do
    it 'returns the top x merchants with the most revenue' do
      merchant1 = create(:merchant, name: 'Bill')
      merchant2 = create(:merchant, name: 'Bob')
      merchant3 = create(:merchant, name: 'Ben')
      merchant4 = create(:merchant, name: 'Tony')
      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)
      invoice4 = create(:invoice, merchant: merchant4)
      item1 = create(:item, name: 'Green', merchant: merchant1)
      item2 = create(:item, name: 'Blue', merchant: merchant2)
      item3 = create(:item, name: 'Red', merchant: merchant3)
      item4 = create(:item, name: 'Car', merchant: merchant4)
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 1, unit_price: 300, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 60, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 30, unit_price: 200, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      get "/api/v1/merchants/most_revenue?quantity=2"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
      expect(merchants.first[:name]).to eq('Ben')
      expect(merchants.second[:name]).to eq('Tony')

      get "/api/v1/merchants/most_revenue?quantity=1"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(1)
      expect(merchants.first[:name]).to eq('Ben')
    end
  end
end
