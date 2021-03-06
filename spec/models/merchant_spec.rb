require 'rails_helper'
describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
    it { should have_many(:customers).through(:invoices) }
  end

  describe 'class methods' do
    it 'returns the top x merchants ranked by total revenue' do
      merchant1 = create(:merchant, name: 'Bill')
      merchant2 = create(:merchant, name: 'Bob')
      merchant3 = create(:merchant, name: 'Ben')
      merchant4 = create(:merchant, name: 'Tony')
      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)
      invoice4 = create(:invoice, merchant: merchant4)
      item1 = create(:item, name: 'Green', merchant: merchant1)
      item2 = create(:item, name: 'Blue', merchant: merchant2)
      item3 = create(:item, name: 'Red', merchant: merchant3)
      item4 = create(:item, name: 'Car', merchant: merchant4)
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 1, unit_price: 300, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 60, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 30, unit_price: 200, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')
      transaction4 = create(:transaction, invoice: invoice4, result: 'success')

      expect(Merchant.most_revenue(2)).to eq([merchant3, merchant4])
      expect(Merchant.most_revenue(1)).to eq([merchant3])
    end
  end
end
