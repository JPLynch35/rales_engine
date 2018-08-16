require 'rails_helper'

describe 'InvoiceItems API' do
  context 'GET /api/v1/invoice_items/find?parameters' do
    it 'can find the invoice item based on id' do
      create_list(:invoice_item, 6)

      get '/api/v1/invoice_items/find?id=3'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(3)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
    it 'can find the invoice item based on invoice_id' do
      invoice1 = create(:invoice)
      create_list(:invoice_item, 5)
      create(:invoice_item, invoice: invoice1)

      get '/api/v1/invoice_items/find?invoice_id=1'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(6)
    end
    it 'can find the invoice item based on item_id' do
      item1 = create(:item)
      create_list(:invoice_item, 5)
      create(:invoice_item, item: item1)

      get '/api/v1/invoice_items/find?item_id=1'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(6)
    end
    it 'can find the invoice item based on quantity' do
      create_list(:invoice_item, 5)
      create(:invoice_item, quantity: 8)

      get '/api/v1/invoice_items/find?quantity=8'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(6)
    end
    it 'can find the invoice item based on unit_price' do
      create_list(:invoice_item, 5)
      create(:invoice_item, unit_price: 800)

      get '/api/v1/invoice_items/find?unit_price=8.00'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(6)
      expect(invoice_item[:unit_price]).to eq('8.00')
    end
    it 'can find the invoice_item based on created_at' do
      create(:invoice_item, created_at: '2012-01-12 09:54:09 UTC')
      create(:invoice_item, created_at: '2012-03-25 09:54:09 UTC')
      create(:invoice_item, created_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/invoice_items/find?created_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(2)
    end
    it 'can find the invoice_item based on updated_at' do
      create(:invoice_item, updated_at: '2012-01-12 09:54:09 UTC')
      create(:invoice_item, updated_at: '2012-03-25 09:54:09 UTC')
      create(:invoice_item, updated_at: '2012-01-12 09:54:09 UTC')

      get '/api/v1/invoice_items/find?updated_at=2012-03-25 09:54:09 UTC'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(2)
    end

    context 'GET /api/v1/invoice_items/find_all?parameters' do
      it 'can find all invoice_items based on id' do
        create_list(:invoice_item, 6)
  
        get '/api/v1/invoice_items/find_all?id=3'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first
  
        expect(invoice_items.count).to eq(1)
        expect(invoice_item[:id]).to eq(3)
        expect(invoice_item).to have_key(:invoice_id)
        expect(invoice_item).to have_key(:item_id)
        expect(invoice_item).to have_key(:quantity)
        expect(invoice_item).to have_key(:unit_price)
      end
      it 'can find all invoice_items based on invoice_id' do
        invoice1 = create(:invoice)
        create_list(:invoice_item, 6)
        create(:invoice_item, invoice: invoice1)
        create(:invoice_item, invoice: invoice1)
  
        get '/api/v1/invoice_items/find_all?invoice_id=1'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first
  
        expect(invoice_items.count).to eq(2)
        expect(invoice_item[:id]).to eq(7)
      end
      it 'can find all invoice_items based on item_id' do
        item1 = create(:item)
        create_list(:invoice_item, 6)
        create(:invoice_item, item: item1)
        create(:invoice_item, item: item1)
        create(:invoice_item, item: item1)
  
        get '/api/v1/invoice_items/find_all?item_id=1'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first
  
        expect(invoice_items.count).to eq(3)
        expect(invoice_item[:id]).to eq(7)
      end
      it 'can find all invoice_items based on quantity' do
        create_list(:invoice_item, 6)
        create(:invoice_item, quantity: 7)
        create(:invoice_item, quantity: 7)
        create(:invoice_item, quantity: 7)
  
        get '/api/v1/invoice_items/find_all?quantity=7'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first
  
        expect(invoice_items.count).to eq(3)
        expect(invoice_item[:id]).to eq(7)
      end
      it 'can find all invoice_items based on unit_price' do
        create_list(:invoice_item, 6)
        create(:invoice_item, unit_price: 700)
        create(:invoice_item, unit_price: 700)
        create(:invoice_item, unit_price: 700)
  
        get '/api/v1/invoice_items/find_all?unit_price=7.00'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first
  
        expect(invoice_items.count).to eq(3)
        expect(invoice_item[:id]).to eq(7)
      end
      it 'can find all invoice_items based on created_at' do
        create(:invoice_item, created_at: '2012-01-12 09:54:09 UTC')
        create(:invoice_item, created_at: '2012-03-25 09:54:09 UTC')
        create(:invoice_item, created_at: '2012-01-12 09:54:09 UTC')
  
        get '/api/v1/invoice_items/find_all?created_at=2012-01-12 09:54:09 UTC'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
  
        expect(invoice_items.count).to eq(2)
      end
      it 'can find all invoice_items based on updated_at' do
        create(:invoice_item, updated_at: '2012-01-12 09:54:09 UTC')
        create(:invoice_item, updated_at: '2012-03-25 09:54:09 UTC')
        create(:invoice_item, updated_at: '2012-01-12 09:54:09 UTC')
  
        get '/api/v1/invoice_items/find_all?updated_at=2012-01-12 09:54:09 UTC'
  
        expect(response).to be_successful
  
        invoice_items = JSON.parse(response.body, symbolize_names: true)
  
        expect(invoice_items.count).to eq(2)
      end
    end
  end
end
