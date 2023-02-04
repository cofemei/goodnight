class User < ApplicationRecord
  has_many :clocks, -> { order "created_at" }
  has_many :user_follows

  validates :name, presence: true

  class << self
    def follows_clocks(user)
      follows_id = user.user_follows.pluck(:follow_id)
      Clock.where(user_id: follows_id)
        .select(:id, :user_id, :is_bedtime, :created_at, "users.name")
        .joins(:user)
        .order("clocks.created_at")
    end
  end
end
