require 'rails_helper'

describe 'Invoice_item items API' do
  context 'GET /api/v1/invoice_items/:id/invoice' do
    it 'returns a collection of associated invoice' do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      create_list(:invoice_item, 4)
      invoice_item = create(:invoice_item, invoice: invoice1)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(invoice1.id)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
    end
  end
end
