require 'rails_helper'

describe 'Business Intelligence API' do
  context 'GET /api/v1/merchants/revenue?date=x' do
    it 'returns the total revenue for date x across all merchants' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice2 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice3 = create(:invoice, created_at: '2012-07-12 14:54:09 UTC')
      invoice4 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 1, unit_price: 500, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item2 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 300, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item3 = create(:invoice_item, invoice: invoice3, quantity: 2, unit_price: 100, created_at: '2012-01-07 14:54:09 UTC')
      invoice_item4 = create(:invoice_item, invoice: invoice4, quantity: 1, unit_price: 1000, created_at: '2012-03-27 14:54:09 UTC')
      transaction1 = create(:transaction, invoice: invoice1, result: 'failed')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      get '/api/v1/merchants/revenue?date=2012-03-27'

      expect(response).to be_successful

      revenue = JSON.parse(response.body)

      expect(revenue['total_revenue']).to eq('16.00')
    end
  end
end
