class UsersController < ApplicationController
  # before_action :logged_in?, only: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  render :index
  end

  def new
     @user = User.new
     render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :current_city, :blurb, :email, :password)
    @user = User.create(user_params)
    if @user.save
      login(@user)
      # flash[:success] = "Welcome to the Vagabond Community!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    user_id = current_user.id

    @user = User.find(user_id)
    render :show
  end

  def edit
    render action: :edit
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(@user)
    else
      render action: :edit
    end
  end

  def destroy
   @user = User.find_by_id(params[:id])
   # post_id=@post[:post_id]
   @user.destroy(current_user)
   redirect_to root_path
  end

  private

    def set_user
      User.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :current_city, :blurb, :password_digest)
    end

end
