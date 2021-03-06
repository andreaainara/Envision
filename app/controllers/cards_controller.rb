class CardsController < ApplicationController
before_action :set_board, only: [:show]
before_action :set_card, only: [:show, :edit, :update]

# I want the cards#create form to be in a modal,
# so as to limit the number of pages...
  def new
    @card = Card.new
    @board = Board.find_by_id(params[:board_id])
    render :new
  end

  def create
    card_params = params.require(:card).permit(:picture, :text)
    @board = Board.find(params[:board_id])
    @card = Card.new(card_params)
    @card.board = @board
    @board.user = current_user
    @cards = Card.all
    if @card.save


      redirect_to board_path(@board.user, @card.board)
    else
      render :new
    end
  end

  def edit
    @card = Card.find_by_id(params[:card_id])
  end

  def update
    @board = Board.find(params[:board_id])
    @card = Card.find(params[:card_id])
    if @card.update(card_params)
      @card.board = @board
      redirect_to board_path(@board)
    else
      render action: :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @card = Card.find(params[:card_id])
    @card.board = @board
    @card.destroy
    redirect_to board_path(@board.user, @board)
  end


  private

    def set_board
      Board.find(params[:board_id])
    end

    def set_card
      Card.find(params[:card_id])
    end

    def card_params
      params.require(:card).permit(:picture, :text)
    end

    def board_params
      params.require(:board).permit(:name)
    end
end
