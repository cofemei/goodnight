# frozen_string_literal: true

module Api
  module V1
    class WeeklyController < Api::ApiBaseController
      def index
        followed = UserFollow.followed_sort_by_sleeptime(current_user)

        render json: {status: 1, total: followed.count, followed: followed}
      end
    end
  end
end
