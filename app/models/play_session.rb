class PlaySession < ApplicationRecord
  belongs_to :user
  belongs_to :level
end
