class Transaction < ApplicationRecord
  validates :credit_card_number,
            :credit_card_expiration_date,
            :result,
            :created_at,
            :updated_at, presence: true

  belongs_to :invoice 

end