class BoardsController < ApplicationController
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
    @board = Board.create(board_params)
    if @board.save
      flash[:success] = "Board created successfully!"
      redirect_to boards_path
    else
      render action: :new
    end
  end

  def show
    @board = Board.find_by_id(params[:id])
    board_id = @board.id
    render :show
  end

  def edit
    render :edit
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to(@board)
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find_by_id(params[:id])
    @board.destroy(board)
    redirect_to user_path(@user)
  end

end
