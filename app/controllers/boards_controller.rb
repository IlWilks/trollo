class BoardsController < ApplicationController
  def index
    @boards = current_user.boards.all
  end

  def show
    @board = current_user.boards.find(params[:id])
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @customer = current_user.boards.create(boards_params)
    if @customer.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  private

  def boards_params
    params.require(:board).permit(:name)
  end
end
