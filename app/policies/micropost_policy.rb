class MicropostPolicy < ApplicationPolicy
  attr_reader :user, :micropost

  def initialize user, micropost
    @user = user
    @micropost = micropost
  end

  def show?
    @user.admin? || @user == @micropost.user || GroupUser.check_group(@user, @micropost.user)
  end

  class Scope < Scope
    def resolve current_user
      if current_user.admin? || user == current_user || GroupUser.check_group(current_user, user)
        scope.where(user_id: user)
      end
    end
  end
end
