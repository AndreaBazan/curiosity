class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])
    @board = @level.board
    @play_session  = PlaySession.new
  end
end
