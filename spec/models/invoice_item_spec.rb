require 'rails_helper'

describe InvoiceItem, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:invoice_id) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
  end

  describe 'relationships' do
    it { should belong_to(:invoice) }
    it { should belong_to(:item) }
  end

  describe 'class methods' do
    it 'can calculate total daily revenue across all merchants' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice2 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice3 = create(:invoice, created_at: '2012-07-12 14:54:09 UTC')
      invoice4 = create(:invoice, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 1, unit_price: 500, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item2 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 300, created_at: '2012-03-27 14:54:09 UTC')
      invoice_item3 = create(:invoice_item, invoice: invoice3, quantity: 2, unit_price: 100, created_at: '2012-07-12 14:54:09 UTC')
      invoice_item4 = create(:invoice_item, invoice: invoice4, quantity: 1, unit_price: 1000, created_at: '2012-03-27 14:54:09 UTC')
      transaction1 = create(:transaction, invoice: invoice1, result: 'failed')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice2, result: 'success')
      transaction4 = create(:transaction, invoice: invoice3, result: 'success')

      expect(InvoiceItem.daily_revenue('2012-03-27')).to eq(1200)
    end
  end
end
