class Transaction < ApplicationRecord
  validates_presence_of :invoice_id, :credit_card_number, :result
  belongs_to :invoice

  default_scope -> {order(id: :asc)}
  scope :success, -> { where(result: 'success')}
  scope :failed, -> { where(result: 'failed')}
end
