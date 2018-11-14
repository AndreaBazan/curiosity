class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])
    # @board = @level.board
    @board = [
      %i[empty empty empty hole],
      %i[hole hole empty hole],
      %i[empty wall robot wall],
      %i[empty wall empty wall],
      %i[empty empty empty hole]
    ]
  end
end
