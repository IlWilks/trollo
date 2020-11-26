class CardsController < ApplicationController
  before_action :set_list
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = @list.cards.all
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to list_cards_path
    else
      render :edit
    end
  end

  def new
    @card = @list.cards.new
  end

  def create
    @card = @list.cards.create(card_params)
    if @card.save
      redirect_to list_cards_path
    else
      render :new
    end
  end

  def destroy
    @card.destroy
    redirect_to list_cards_path
  end

  private

  def set_card
    @card = @list.cards.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:name, :body)
  end
end
