class PlaySessionsController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @level = Level.find(params[:level_id])
    actions = parse_actions
    board = Board.new(squares: @level.board)
    robot = Robot.new(board: board)
    robot.execute(actions)
  end

  private

  def parse_actions
    JSON.parse(play_session_params[:actions]).map do |action|
      OpenStruct.new(action)
    end
  end

  def play_session_params
    params.require(:play_session).permit(:actions)
  end
end
