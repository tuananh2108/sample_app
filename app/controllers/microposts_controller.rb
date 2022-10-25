class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def index
    redirect_to request.referer(q: params[:q])
  end

  def show
    @micropost = Micropost.find_by id: params[:id]
    @comment = Comment.new
    @pagy, @comments = pagy @micropost.comments.not_parent.decorate,
                            items: Settings.number_row_page
  end

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = t ".flash_success"
      redirect_to root_path
    else
      @pagy, @feed_items = pagy current_user.feed
      flash[:danger] = t ".flash_danger"
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t ".flash_success"
    else
      flash[:danger] = t ".flash_danger"
    end
    redirect_to request.referer || root_path
  end

  private
  def micropost_params
    params.require(:micropost).permit :content, :image
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    return if @micropost

    flash[:danger] = t ".correct_user_error"
    redirect_to request.referer || root_path
  end
end
