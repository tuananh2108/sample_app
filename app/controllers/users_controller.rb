class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
<<<<<<< HEAD
    user_not_found unless @user
=======
    return if @user

    flash[:danger] = t ".error"
    redirect_to root_path
>>>>>>> chapter_9
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
<<<<<<< HEAD
=======
      log_in @user
>>>>>>> chapter_9
      flash[:success] = t ".create_successful"
      redirect_to @user
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(User::USER_ATTRIBUTE)
  end
end
