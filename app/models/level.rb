class Level < ApplicationRecord
  has_many :play_sessions
  belongs_to :game
end
