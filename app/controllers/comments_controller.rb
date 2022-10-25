class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    if @comment.save
      redirect_to request.referer
    else
      render "microposts/show"
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment&.destroy
      flash[:success] = t ".flash_susscess"
    else
      flash[:danger] = t ".flash_danger"
    end
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id, :micropost_id, :parent_id
  end
end
