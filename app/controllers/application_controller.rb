class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper
  include Pagy::Backend
  include Pundit::Authorization
  protect_from_forgery

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".logged_in_user_error"
    redirect_to login_url
  end
end
