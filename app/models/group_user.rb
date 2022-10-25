class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  class << self
    def check_group user1, user2
      @group_user_1 = self.where user_id: user1.id
      @group_user_2 = self.where user_id: user2.id

      return false unless @group_user_1 && @group_user_2

      @group_user_1.find_by user_id: user1, group_id: @group_user_2
    end
  end
end
