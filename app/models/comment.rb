class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :content,
            presence: true

  scope :not_parent, ->{where parent_id: nil}
  scope :have_parent, ->(parent_id){where parent_id:}
end
