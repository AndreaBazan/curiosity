class PlaySessionsController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    binding.pry    
  end

  private

  def play_session_params
    params.require(:play_session).permit(:actions)
  end
end
