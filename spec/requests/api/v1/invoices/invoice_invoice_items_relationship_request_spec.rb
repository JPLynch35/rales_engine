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

      invoice_item = invoice_items.first
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end
end
