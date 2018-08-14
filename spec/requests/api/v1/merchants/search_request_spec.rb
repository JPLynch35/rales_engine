require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/find?parameters' do
    it 'can find the merchant based on id' do
      create_list(:merchant, 3)

      get '/api/v1/merchants/find?id=3'

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:id]).to eq(3)
      expect(merchant).to have_key(:name)
      expect(merchant).to have_key(:created_at)
      expect(merchant).to have_key(:updated_at)
    end
    it 'can find a single merchant by case insensitive name' do
      name1 = 'Bob Soopers'
      name2 = 'Costmoore'
      name3 = 'Walyellows'
      create(:merchant, name: name1)
      create(:merchant, name: name2)
      create(:merchant, name: name3)

      get "/api/v1/merchants/find?name=#{name1}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:name]).to eq(name1)
    end
    it 'can find all merchants based on created_at' do
      created1 = '2012-01-12 09:54:09 UTC'
      create(:merchant, created_at: created1)
      create(:merchant, created_at: '2012-03-25 09:54:09 UTC')
      create(:merchant, created_at: created1)

      get "/api/v1/merchants/find_all?created_at=#{created1}"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
    end
    it 'can find all merchants based on updated_at' do
      updated1 = '2012-01-12 09:54:09 UTC'
      create(:merchant, updated_at: updated1)
      create(:merchant, updated_at: '2012-03-25 09:54:09 UTC')
      create(:merchant, updated_at: updated1)

      get "/api/v1/merchants/find_all?updated_at=#{updated1}"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
    end
  end
end
