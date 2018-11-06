class UsersController < ApplicationController
  def dashboard
    @games = Game.all
  end
end
