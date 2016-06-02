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
    # board_id = @board.id
    render :show
  end

  def edit
    render :edit
  end

  def update
    @board = Board.find(params[:board_id])
    if @board.update(board_params)
      redirect_to(@board)
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @board.destroy
    redirect_to boards_path
  end

end
