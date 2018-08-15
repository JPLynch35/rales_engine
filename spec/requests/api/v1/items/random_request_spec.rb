require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items/random' do
    it 'can return a random item' do
      create_list(:item, 3)

      get '/api/v1/items/random'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(1).or eq(2).or eq(3)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end
end
