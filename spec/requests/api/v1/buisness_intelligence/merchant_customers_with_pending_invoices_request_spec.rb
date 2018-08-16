require 'rails_helper'

describe 'Business Intelligence API' do
  context 'GET /api/v1/merchants/:id/customers_with_pending_invoices' do
    it 'returns a collection of customers which have unpaid invoices' do
      merchant1 = create(:merchant, name: 'Bill')
      customer1 = create(:customer, first_name: 'Jill')
      customer2 = create(:customer, first_name: 'Jess')
      customer3 = create(:customer, first_name: 'Jen')
      customer4 = create(:customer, first_name: 'Hank')
      invoice1 = create(:invoice, merchant: merchant1, customer: customer1)
      invoice2 = create(:invoice, merchant: merchant1, customer: customer2)
      invoice3 = create(:invoice, merchant: merchant1, customer: customer3)
      invoice4 = create(:invoice, merchant: merchant1, customer: customer4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'failed')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'failed')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      get "/api/v1/merchants/1/customers_with_pending_invoices"

      expect(response).to be_successful

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers.count).to eq(2)
      expect(customers.first[:first_name]).to eq('Jill')
      expect(customers.second[:first_name]).to eq('Jen')
    end
  end
end
