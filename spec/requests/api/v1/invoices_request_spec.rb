require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices.json' do
    it 'returns a list of all invoices' do
      create_list(:invoice, 6)

      get '/api/v1/invoices.json'

      expect(response).to be_successful

      invoices = JSON.parse(response.body, symbolize_names: true)
      invoice = invoices.first

      expect(invoices.count).to eq(6)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
      expect(invoice).to have_key(:created_at)
      expect(invoice).to have_key(:updated_at)
    end
  end

  context 'GET /api/v1/invoices/:id.json' do
    it 'returns the specified id invoice' do
      create_list(:invoice, 6)

      get '/api/v1/invoices/4.json'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice.id).to eq(4)
    end
  end
end
