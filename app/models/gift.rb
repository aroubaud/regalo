class Gift < ApplicationRecord
  has_many :gift_features
  has_many :features, through: :gift_features
end
