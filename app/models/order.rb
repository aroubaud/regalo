class Order < ApplicationRecord
  belongs_to :user
  belongs_to :gift

  monetize :amount_cents
end
