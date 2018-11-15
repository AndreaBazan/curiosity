class LevelsController < ApplicationController
  def play
    @level = Level.find(params[:id])
    # @board = @level.board
    @board = [
      %i[robot empty empty quicksand],
      %i[quicksand quicksand empty quicksand],
      %i[empty tree empty tree],
      %i[empty tree empty tree],
      %i[empty empty empty quicksand]
    ]
  end
end
