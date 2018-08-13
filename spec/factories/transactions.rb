FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number '1234567891'
    credit_card_expiration_date ''
    result 'success'
  end
end
