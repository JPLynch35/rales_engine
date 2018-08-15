require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/:id/customer' do
    it 'returns the associated customer' do
      customer1 = create(:customer)
      invoice = create(:invoice, customer: customer1)

      get "/api/v1/invoices/#{invoice.id}/customer"

      expect(response).to be_successful

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:first_name]).to eq(customer1.first_name)
      expect(customer).to have_key(:first_name)
      expect(customer).to have_key(:last_name)
    end
  end
end
