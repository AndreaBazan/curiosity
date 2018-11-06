class PlaySessionController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = game.create!(games_params)
      redirect_to games_path(@game)
  end
end
