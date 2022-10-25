class GroupsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :find_by_group_name, only: %i(create)

  def index
    @group = Group.new
    @group_user = GroupUser.new
    @q = Group.all.ransack(params[:q])
    @pagy, @groups = pagy @q.result.decorate, items: Settings.number_row_page
  end

  def create
    @group = Group.new group_params
    @group_user = GroupUser.new
    @q = Group.all.ransack(params[:q])
    @pagy, @groups = pagy @q.result.decorate, items: Settings.number_row_page
    if @group.save
      create_group_user
      flash[:success] = t ".flash_success"
      redirect_to groups_path
    else
      flash[:danger] = t ".flash_danger"
      render "groups/index"
    end
  end

  def destroy
    @group = Group.find_by id: params[:id]
    if @group&.destroy
      flash[:success] = t ".flash_success"
    else
      flash[:danger] = t ".flash_danger"
    end
    redirect_to request.referer
  end

  private
  def group_params
    params.require(:group).permit :name
  end

  def create_group_user
    group = Group.last
    GroupUser.create(group:, user: current_user, is_created: true)
  end

  def find_by_group_name
    @group = Group.find_by name: params[:name]
    return unless @group

    flash[:danger] = t ".flash_danger"
    redirect_to request.referer || groups_path
  end
end
