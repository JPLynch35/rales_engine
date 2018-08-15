require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/:id/transactions' do
    it 'returns a collection of associated transactions' do
      invoice = create(:invoice)
      create_list(:transaction, 3, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)
      expect(transactions.count).to eq(3)

      transaction = transactions.first
      expect(transaction).to have_key(:invoice_id)
      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to have_key(:result)
    end
  end
end
