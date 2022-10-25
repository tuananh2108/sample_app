class GroupUsersController < ApplicationController
  before_action :logged_in_user, only: %i(create)

  def create
    @group_user = GroupUser.new group_user_params
    if @group_user.save
      flash[:success] = t ".flash_success"
      redirect_to groups_path
    else
      flash[:danger] = t ".flash_danger"
      render "groups/index"
    end
  end

  private
  def group_user_params
    params.require(:group_user).permit :user_id, :group_id
  end
end
