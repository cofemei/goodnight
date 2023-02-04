# frozen_string_literal: true

module Api
  module V1
    class ClocksController < Api::ApiBaseController
      def index
        clocks = paginate(current_user.clocks)
        total = current_user.clocks.count

        render json: {status: 1, total: total, page: @page, per_page: @per_page, colocks: clocks}
      end

      def create
        clock = current_user.clocks.create(clock_params)

        if clock&.errors&.full_messages
          render json: {status: 0, message: clock.errors.full_messages, clock: clock}
        else
          render json: {status: 1, message: "Create clock success", clock: clock}
        end
      end

      private

      def clock_params
        params.require(:clock).permit(:is_bedtime)
      end
    end
  end
end
