class BoardsController < ApplicationController
  def new
    @board = Board.new
    render :new
  end

  def create
    board_params = params.require(:board).permit(:name, :card)
    @board = Board.create(board_params)
    if @board.save
      flash[:success] = "Board created successfully!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    board_id = board.id
    @board = Board.find(board_id)
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
