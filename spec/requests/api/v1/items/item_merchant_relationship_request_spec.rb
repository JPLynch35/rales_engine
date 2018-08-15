require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items/:id/merchant' do
    it 'returns the associated merchant' do
      merchant = create(:merchant, name: 'Bobs')
      item = create(:item, merchant: merchant)

      get "/api/v1/items/#{item.id}/merchant"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:name]).to eq('Bobs')
    end
  end
end
