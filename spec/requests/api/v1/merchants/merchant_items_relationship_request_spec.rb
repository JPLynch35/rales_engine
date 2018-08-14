require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/:id/items' do
    it 'returns a collection of associated items' do
      merchant = create(:merchant)
      create_list(:item, 5, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)
      expect(items.count).to eq(5)

      item = items.first
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
      expect(item).to_not have_key(:created_at)
      expect(item).to_not have_key(:updated_at)
    end
  end
end
