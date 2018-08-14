require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/random' do
    it 'can return a random merchant' do
      create_list(:merchant, 3)

      get '/api/v1/merchants/random'

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:id]).to eq(1).or eq(2).or eq(3)
      expect(merchant).to have_key(:name)
    end
  end
end
