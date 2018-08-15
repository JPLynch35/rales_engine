require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/:id/merchant' do
    it 'returns the associated merchant' do
      merchant1 = create(:merchant)
      invoice = create(:invoice, merchant: merchant1)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:name]).to eq(merchant1.name)
      expect(merchant).to have_key(:name)
    end
  end
end
