class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])

    @board = @level.board

  end
end
