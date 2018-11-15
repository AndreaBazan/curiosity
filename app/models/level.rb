class Level < ApplicationRecord
  has_many :play_sessions, dependent: :destroy
  belongs_to :game
  serialize :board, JSON
  validates :board, presence: true
end
