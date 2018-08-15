require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items.json' do
    it 'returns a list of all items' do
      create_list(:item, 6)

      get '/api/v1/items.json'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(items.count).to eq(6)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end

  context 'GET /api/v1/items/:id.json' do
    it 'returns the specified id item' do
      id = create(:item).id

      get "/api/v1/items/#{id}.json"

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(id)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end
end