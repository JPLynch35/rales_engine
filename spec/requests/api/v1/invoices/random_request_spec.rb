require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/random' do
    it 'can return a random invoice' do
      create_list(:invoice, 3)

      get '/api/v1/invoices/random'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(1).or eq(2).or eq(3)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
      expect(invoice).to have_key(:created_at)
      expect(invoice).to have_key(:updated_at)
    end
  end
end
