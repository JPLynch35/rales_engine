require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/:id/invoice_items' do
    it 'returns a collection of associated invoice items' do
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      create(:invoice_item, item: item1, invoice: invoice)
      create(:invoice_item, item: item2, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first).to have_key(:item_id)
      expect(invoice_items.first).to have_key(:invoice_id)
      expect(invoice_items.first).to have_key(:quantity)
      expect(invoice_items.first).to have_key(:unit_price)
      expect(invoice_items.first).to have_key(:created_at)
      expect(invoice_items.first).to have_key(:updated_at)
    end
  end

  context 'GET /api/v1/invoices/:id/items' do
    it 'returns a collection of associated items' do
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      create(:invoice_item, item: item1, invoice: invoice)
      create(:invoice_item, item: item2, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
      expect(items.first).to have_key(:name)
      expect(items.first).to have_key(:description)
      expect(items.first).to have_key(:unit_price)
      expect(items.first).to have_key(:merchant_id)
      expect(items.first).to have_key(:created_at)
      expect(items.first).to have_key(:updated_at)
    end
  end

  context 'GET /api/v1/invoices/:id/items' do
    it 'returns a collection of associated items' do
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      create(:invoice_item, item: item1, invoice: invoice)
      create(:invoice_item, item: item2, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
      expect(items.first).to have_key(:name)
      expect(items.first).to have_key(:description)
      expect(items.first).to have_key(:unit_price)
      expect(items.first).to have_key(:merchant_id)
      expect(items.first).to have_key(:created_at)
      expect(items.first).to have_key(:updated_at)
    end
  end

  context 'GET /api/v1/invoices/:id/transactions' do
    it 'returns a collection of associated transactions' do
      invoice = create(:invoice)
      create_list(:transaction, 3, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions.count).to eq(3)
      expect(transactions.first).to have_key(:invoice_id)
      expect(transactions.first).to have_key(:credit_card_number)
      expect(transactions.first).to have_key(:credit_card_expiration_date)
      expect(transactions.first).to have_key(:result)
      expect(transactions.first).to have_key(:created_at)
      expect(transactions.first).to have_key(:updated_at)
    end
  end

  context 'GET /api/v1/invoices/:id/merchant' do
    it 'returns the associated merchant' do
      merchant1 = create(:merchant)
      invoice = create(:invoice, merchant: merchant1)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:name]).to eq(merchant1.name)
      expect(merchant).to have_key(:name)
      expect(merchant).to have_key(:created_at)
      expect(merchant).to have_key(:updated_at)
    end
  end

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
      expect(customer).to have_key(:created_at)
      expect(customer).to have_key(:updated_at)
    end
  end
end
