require 'rails_helper'

describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'relationships' do
    it { should have_many(:invoices) }
    it { should have_many(:merchants).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'class methods' do
    it 'can find the customer with the most number of successful transactions for a merchant' do
      merchant1 = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer, first_name: 'Bill')
      customer3 = create(:customer)
      invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
      invoice3 = create(:invoice, customer: customer2, merchant: merchant1)
      invoice4 = create(:invoice, customer: customer3, merchant: merchant1)
      transaction1 = create(:transaction, invoice: invoice1, result: 'failed')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')
      transaction3 = create(:transaction, invoice: invoice2, result: 'success')
      transaction4 = create(:transaction, invoice: invoice3, result: 'success')

      expect(Customer.fav_customer(merchant1.id)).to eq(customer2)
    end
  end
end
