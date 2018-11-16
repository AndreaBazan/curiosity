class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])
    levels = @level.game.levels.index(@level)
    @next_level = Level.find(params[:id].to_i + 1)
    @board = @level.board
    @play_session  = PlaySession.new
  end
end
