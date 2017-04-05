class UsersController < ApplicationController
  before_action :is_admin?, only: [:new, :show]
  def new
    @user = User.new
  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to root_path, notice: "Welcome"
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def is_admin?
    if logged_in?
      if !@current_user.is_admin
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end


end
