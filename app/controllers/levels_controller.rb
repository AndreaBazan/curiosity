class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])
    # @board = @level.board
    @board = [
      %i[robot empty empty hole],
      %i[hole hole empty hole],
      %i[empty wall empty wall],
      %i[empty wall empty wall],
      %i[empty empty empty hole]
    ]
  end
end
