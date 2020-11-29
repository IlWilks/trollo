class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all_boards(current_user.id)
  end

  def show
  end

  def new
    @board = current_user.boards.new
  end

  def create
    Board.create_board(boards_params, current_user.id)
    redirect_to boards_path
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    Board.update_board(@board.id, boards_params)
    redirect_to boards_path
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def set_board
    def set_board
      #SELECT single record
      @board = Board.single_board(current_user.id, params[:id])
    end
  end

  def boards_params
    params.require(:board).permit(:name)
  end
end
