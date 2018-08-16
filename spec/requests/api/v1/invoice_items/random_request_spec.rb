require 'rails_helper'

describe 'Invoice items API' do
  context 'GET /api/v1/invoice_items/random' do
    it 'can return a random invoice' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items/random'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(1).or eq(2).or eq(3)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end
end
