FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number '1234567891'
    credit_card_expiration_date '10/12/2018'
    result 'success'
  end
end
