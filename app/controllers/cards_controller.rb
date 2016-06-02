class CardsController < ApplicationController
before_action :set_board, only: [:show, :edit, :update, :destroy]
before_action :set_card, only: [:show, :edit, :update, :destroy]

# as of right now, I'm unsure about the need for cards#index
# because they will be displayed on the board page and that's it
def index
  @cards = Card.all
  @boards = Board.find
  render 'boards/show' #see travis/arthur about this
end

# I want to be the cards#create form to be in a modal,
# so as to limit the number of pages...
  def new
    render :new
  end

  def create

  end

  private

  def set_board
    Board.find(params[:board_id])
  end

  def set_card
  end

  def card_params
  end
end
