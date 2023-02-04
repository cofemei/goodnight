class UserFollow < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User', foreign_key: :follow_id

  validates :follow_id, uniqueness: { scope: :user_id }
end
