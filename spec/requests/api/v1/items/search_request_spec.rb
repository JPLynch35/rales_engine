require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items/find?parameters' do
    it 'can find the item based on id' do
      create_list(:item, 6)

      get '/api/v1/items/find?id=3'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(3)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
    it 'can find the item based on name' do
      create_list(:item, 5)
      create(:item, name: 'Santas Hat')

      get '/api/v1/items/find?name=Santas Hat'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(6)
      expect(item[:name]).to eq('Santas Hat')
    end
    it 'can find the item based on description' do
      create_list(:item, 5)
      create(:item, description: 'Santas Hat is pretty awesome')

      get '/api/v1/items/find?description=Santas Hat is pretty awesome'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(6)
      expect(item[:description]).to eq('Santas Hat is pretty awesome')
    end
    it 'can find the item based on unit_price' do
      create_list(:item, 5)
      create(:item, unit_price: 800)

      get '/api/v1/items/find?unit_price=800'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(6)
      expect(item[:unit_price]).to eq(800)
    end
    it 'can find the item based on merchant_id' do
      merchant = create(:merchant)
      create_list(:item, 5)
      create(:item, merchant: merchant)

      get "/api/v1/items/find?merchant_id=#{merchant.id}"

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(6)
      expect(item[:merchant_id]).to eq(merchant.id)
    end
    it 'can find the item based on created_at' do
      create(:item, created_at: '2012-01-12 09:54:09 UTC')
      create(:item, created_at: '2012-03-25 09:54:09 UTC')
      create(:item, created_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/items/find?created_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(2)
    end
    it 'can find the item based on updated_at' do
      create(:item, updated_at: '2012-01-12 09:54:09 UTC')
      create(:item, updated_at: '2012-03-25 09:54:09 UTC')
      create(:item, updated_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/items/find?updated_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(2)
    end
  end

  context 'GET /api/v1/items/find_all?parameters' do
    it 'can find all items based on id' do
      create_list(:item, 6)

      get '/api/v1/items/find_all?id=3'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(items.count).to eq(1)
      expect(item[:id]).to eq(3)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
    it 'can find all items based on name' do
      create_list(:item, 5)
      create(:item, name: 'suitcase')
      create(:item, name: 'suitcase')

      get '/api/v1/items/find_all?name=suitcase'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
    end
    it 'can find all items based on description' do
      create_list(:item, 5)
      create(:item, description: 'super heavy and large')
      create(:item, description: 'super heavy and large')

      get '/api/v1/items/find_all?description=super heavy and large'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
    end
    it 'can find all items based on unit_price' do
      create(:item, unit_price: '800')
      create(:item, unit_price: '800')
      create(:item, unit_price: '800')
      create_list(:item, 5)

      get '/api/v1/items/find_all?unit_price=800'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(3)
    end
    it 'can find all items based on merchant_id' do
      create(:merchant)
      merchant = create(:merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create_list(:item, 5)

      get '/api/v1/items/find_all?merchant_id=2'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(3)
    end
    it 'can find all items based on created_at' do
      create(:item, created_at: '2012-01-12 09:54:09 UTC')
      create(:item, created_at: '2012-03-25 09:54:09 UTC')
      create(:item, created_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/items/find_all?created_at=2012-01-12 09:54:09 UTC'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
    end
    it 'can find all items based on updated_at' do
      create(:item, updated_at: '2012-01-12 09:54:09 UTC')
      create(:item, updated_at: '2012-03-25 09:54:09 UTC')
      create(:item, updated_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/items/find_all?updated_at=2012-01-12 09:54:09 UTC'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(2)
    end
  end
end
