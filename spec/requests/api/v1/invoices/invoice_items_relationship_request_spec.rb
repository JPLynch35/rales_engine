require 'rails_helper'

describe 'Invoices API' do
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

      item = items.first
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end
end
