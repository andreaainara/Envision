class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def new
    @board = Board.new
    render :new
  end

  def create
    board_params = params.require(:board).permit(:name)
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      flash[:success] = "Board created successfully!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @board = Board.find_by_id(params[:board_id])
    @cards = Card.where(board_id: @board.id)
    @card = Card.new
    render :show
  end

  def edit
    # @board.user = current_user
    @board = Board.find_by_id(params[:board_id])
    render :edit
  end

  def update
    @board = Board.find(params[:board_id])
    if @board.update(board_params)
      @board.user = current_user
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @board.user = current_user
    @board.destroy
    redirect_to user_path(current_user)
  end

  private

    def set_board
      Board.find(params[:board_id])
    end

    def board_params
      params.require(:board).permit(:name)
    end


end
