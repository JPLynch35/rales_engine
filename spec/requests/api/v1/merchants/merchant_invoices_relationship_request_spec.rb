require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/:id/invoices' do
    it 'returns a collection of associated invoices' do
      merchant = create(:merchant)
      create(:invoice, merchant: merchant)
      create(:invoice, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      expect(response).to be_successful

      invoices = JSON.parse(response.body, symbolize_names: true)
      expect(invoices.count).to eq(2)

      invoice = invoices.first
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
    end
  end
end
