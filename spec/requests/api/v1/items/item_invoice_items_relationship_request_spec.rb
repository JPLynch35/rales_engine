require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items/:id/invoice_items' do
    it 'returns a collection of associated invoice items' do
      item = create(:item)
      create_list(:invoice_item, 4)
      create_list(:invoice_item, 6, item: item)

      get "/api/v1/items/#{item.id}/invoice_items"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body, symbolize_names: true)
      invoice_item = invoice_items.first

      expect(invoice_items.count).to eq(6)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end
end
