class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
    render :index
  end

  def new
    @board = Board.new
    render action: :new
  end

  def create
    board_params = params.require(:board).permit(:name)
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      flash[:success] = "Board created successfully!"
      redirect_to boards_path
    else
      render action: :new
    end
  end

  def show
    @board = Board.find_by_id(params[:board_id])

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
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @board.destroy
    redirect_to boards_path
  end

  private

    def set_board
      Board.find(params[:board_id])
    end

    def board_params
      params.require(:board).permit(:name)
    end


end
