class Game < ApplicationRecord
  has_many :levels, dependent: :destroy
end