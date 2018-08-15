class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :transactions do |t|
      t.bigint :invoice_id
      t.bigint :credit_card_number
      t.datetime :credit_card_expiration_date
      t.citext :result

      t.timestamps
    end
  end
end
