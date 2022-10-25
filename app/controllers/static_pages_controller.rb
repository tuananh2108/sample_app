class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @q = current_user.microposts.ransack(params[:q])
    @pagy, @feed_items = pagy @q.result,
                              items: Settings.number_row_page
  end

  def help; end

  def contact; end
end
