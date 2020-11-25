class ListsController < ApplicationController
  before_action :set_board

  def index
    @lists = @board.lists.all
  end

  def show
    @list = @board.lists.find(params[:id])
  end

  def edit
    @list = @board.lists.find(params[:id])
  end

  def update
    @list = @board.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to board_lists_path
    else
      render :edit
    end
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.create(list_params)
    if @list.save
      redirect_to board_lists_path
    else
      render :new
    end
  end

  def destroy
    @list = @board.lists.find(params[:id])
    @list.destroy
    redirect_to board_lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_board
    @board = current_user.boards.find(params[:board_id])
  end
end
