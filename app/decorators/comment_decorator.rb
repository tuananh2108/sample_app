class CommentDecorator < ApplicationDecorator
  def check_have_parent
    Comment.have_parent object.id
  end
end
