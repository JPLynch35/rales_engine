require 'rails_helper'

describe 'Invoice_item items API' do
  context 'GET /api/v1/invoice_items/:id/item' do
    it 'returns a collection of associated item' do
      item1 = create(:item)
      item2 = create(:item)
      create_list(:invoice_item, 4)
      invoice_item = create(:invoice_item, item: item1)

      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(item1.id)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end
end
