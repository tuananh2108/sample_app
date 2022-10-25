class GroupDecorator < ApplicationDecorator
  def is_group_created?
    GroupUser.find_by user_id: current_user.id, group_id: object.id, is_created: true
  end

  def check_group_user?
    GroupUser.find_by user_id: current_user.id, group_id: object.id
  end
end
