class PlaySession < ApplicationRecord
  belongs_to :user
  belongs_to :level

  def actions
    
  end
end
