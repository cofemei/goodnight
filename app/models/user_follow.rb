# frozen_string_literal: true

class UserFollow < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User', foreign_key: :follow_id

  validates :follow_id, uniqueness: { scope: :user_id }

  class << self
    def followed_sort_by_sleeptime(user)
      follows_id = user.user_follows.pluck(:follow_id)
      clocks = Clock
        .where(user_id: follows_id)
        .where('clocks.created_at >= ?', Time.current.beginning_of_week)
        .select(:id, :user_id, :is_bedtime, :created_at, "users.name")
        .joins(:user)
        .order("clocks.created_at")

      result = []

      clocks_grouped = clocks.group_by { _1.user_id }
      clocks_grouped.keys.each do |k|
        point = { user_id: k, name: nil, start_time: nil, end_time: nil, total: 0 }
        # Pickup wakeup first
        # Calculate sleep time when both start_time and end_time
        clocks_grouped[k].reverse_each do |c|
          if c[:is_bedtime]
            if point[:end_time] != nil
              point[:start_time] = c[:created_at].to_i
            end
          else
            if point[:end_time].nil?
              point[:end_time] = c[:created_at].to_i
            end
          end
          if point[:start_time] !=nil && point[:end_time] != nil
            point[:name] = c.name
            point[:total] += point[:end_time] - point[:start_time]
            point[:start_time] = nil
            point[:end_time] = nil
          end
        end
        result << point
      end

      result.sort_by { -_1[:total] }
    end
  end
end
