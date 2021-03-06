require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:merchant_id) }
  end

  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'class methods' do
    it 'can find the top x items with the highest revenues' do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice)
      invoice4 = create(:invoice)
      item1 = create(:item, name: 'Green')
      item2 = create(:item, name: 'Blue')
      item3 = create(:item, name: 'Red')
      item4 = create(:item, name: 'Car')
      invoice_item1 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: invoice1, item: item1)
      invoice_item2 = create(:invoice_item, quantity: 100, unit_price: 300, invoice: invoice2, item: item2)
      invoice_item3 = create(:invoice_item, quantity: 60, unit_price: 300, invoice: invoice3, item: item3)
      invoice_item4 = create(:invoice_item, quantity: 30, unit_price: 200, invoice: invoice4, item: item4)
      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice3, result: 'success')

      expect(Item.most_revenue(1).to_a.count).to eq(1)
      expect(Item.most_revenue(2).to_a.count).to eq(2)
      expect(Item.most_revenue(2).first[:name]).to eq('Blue')
      expect(Item.most_revenue(2).last[:name]).to eq('Red')
    end
  end
end
