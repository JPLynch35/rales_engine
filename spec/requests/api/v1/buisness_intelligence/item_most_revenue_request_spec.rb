require 'rails_helper'

describe 'Business Intelligence API' do
  context 'GET /api/v1/items/most_revenue?quantity=x' do
    it 'returns the top x items with the most revenue' do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice)
      invoice4 = create(:invoice)
      item1 = create(:item, name: 'Green')
      item2 = create(:item, name: 'Blue')
      item3 = create(:item, name: 'Red')
      item4 = create(:item, name: 'Car')
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 1, unit_price: 300, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 60, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 30, unit_price: 200, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      get "/api/v1/items/most_revenue?quantity=2"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
      expect(items.first[:name]).to eq('Red')
      expect(items.second[:name]).to eq('Car')

      get "/api/v1/items/most_revenue?quantity=1"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(1)
      expect(items.first[:name]).to eq('Red')
    end
  end
end
