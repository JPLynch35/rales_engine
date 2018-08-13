class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :invoices do |t|
      t.bigint :customer_id
      t.bigint :merchant_id
      t.citext :status

      t.timestamps
    end
  end
end
