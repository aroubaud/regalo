class Gift < ApplicationRecord
  has_many :features, through: :gift_features
  has_many :gift_features
end
