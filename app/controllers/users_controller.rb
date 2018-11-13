class UsersController < ApplicationController
  def dashboard
    @games = Game.all
    flash[:notice]
  end
end
