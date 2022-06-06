class UsersController < ApplicationController
  before_action :find_user, except: %i(index new create)
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)

  def index
    @pagy, @users = pagy(User.all, items: 10)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".create_info"
      redirect_to login_url
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update :user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      flash[:danger] = t ".update_failed"
      render :edit
    end
  end

  def destroy
    if @user&.destroy
      flash[:success] = t "destroy_success"
    else
      flash[:danger] = t "destroy_failed"
    end
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(User::USER_ATTRIBUTE)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".logged_in_user"
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end
end
