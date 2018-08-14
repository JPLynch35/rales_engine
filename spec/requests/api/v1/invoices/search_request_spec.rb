require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/find?parameters' do
    it 'can find the invoice based on id' do
      create_list(:invoice, 6)

      get '/api/v1/invoices/find?id=3'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(3)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
      expect(invoice).to have_key(:created_at)
      expect(invoice).to have_key(:updated_at)
    end
    it 'can find the invoice based on customer_id' do
      create_list(:customer, 10)
      create(:invoice, customer_id: 4)
      create(:invoice, customer_id: 2)
      create(:invoice, customer_id: 7)

      get '/api/v1/invoices/find?customer_id=4'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(1)
    end
    it 'can find the invoice based on merchant_id' do
      create_list(:merchant, 10)
      create(:invoice, merchant_id: 4)
      create(:invoice, merchant_id: 2)
      create(:invoice, merchant_id: 7)

      get '/api/v1/invoices/find?merchant_id=4'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(1)
    end
    it 'can find the invoice based on status' do
      create(:invoice, status: 'shipped')
      create(:invoice, status: 'returned')
      create(:invoice, status: 'returned')

      get '/api/v1/invoices/find?status=shipped'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(1)
    end
    it 'can find the invoice based on created_at' do
      create(:invoice, created_at: '2012-01-12 09:54:09 UTC')
      create(:invoice, created_at: '2012-03-25 09:54:09 UTC')
      create(:invoice, created_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/invoices/find?created_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(2)
    end
    it 'can find the invoice based on updated_at' do
      create(:invoice, updated_at: '2012-01-12 09:54:09 UTC')
      create(:invoice, updated_at: '2012-03-25 09:54:09 UTC')
      create(:invoice, updated_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/invoices/find?updated_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(2)
    end
  end
end