require 'rails_helper'

describe 'Invoice items API' do
  context 'GET /api/v1/invoice_items.json' do
    it 'returns a list of all invoice_items' do
      create_list(:invoice_item, 6)

      get '/api/v1/invoice_items.json'

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body, symbolize_names: true)
      invoice_item = invoice_items.first

      expect(invoice_items.count).to eq(6)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end

  context 'GET /api/v1/invoice_items/:id.json' do
    it 'returns the specified id invoice_item' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/#{id}.json"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(id)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end
end
