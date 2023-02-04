# frozen_string_literal: true

module Api
  module V1
    class UserFollowsController < Api::ApiBaseController
      before_action :user_valid, only: [:index, :create]

      def index
        #clocks = paginate(User.follows_clocks(current_user))
        user_follows = UserFollow
          .select(:id, :follow_id, :created_at, "users.name")
          .where(user_id: current_user.id)
          .joins(:follow)
          .order(:created_at)

        user_follows = paginate(user_follows)
        total = current_user.user_follows.count

        render json: {status: 1, total: total, page: @page, per_page: @per_page, user_follows: user_follows}
      end

      def create
        user_follows = current_user.user_follows.create(follow_params)

        if user_follows.errors.full_messages.present?
          render json: { status: 0, message: "Create follow get error #{user_follows.errors.full_messages.join(',')}" }
        else
          render json: { status: 1, message: "Create follow success" }
        end
      end

      def destroy
        user_follows = current_user.user_follows.find(follow_params)

        if user_follows
          user_follows.delete
          render json: { status: 1, message: "Destory follow success" }
        else
          render json: { status: 0, message: "Destory follow failed" }
        end
      end

      private

      def follow_params 
        params.permit(:follow_user_id)
      end

      def user_valid
        render json: { status: 0, message: 'current user does not exist' } if current_user.nil?
      end
    end
  end
end
