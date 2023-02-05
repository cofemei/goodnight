# frozen_string_literal: true

module Api
  module V1
    class ClocksController < Api::ApiBaseController
      def index
        clocks = paginate(current_user.clocks)
        total = current_user.clocks.count

        if clocks
          render json: ClocksIndexSerializer.new({status: 1, message: 'success', total: total, page: @page, per_page: @per_page, clocks: clocks})
        else
          render json: ClocksIndexSerializer.new({status: 0, message: 'user clock can not found ', total: total, page: @page, per_page: @per_page, clocks: clocks})
        end
      end

      def create
        clock = current_user.clocks.create(clock_params)

        if clock&.errors&.full_messages
          render json: ClockShowSerializer.new({status: 0, message: clock.errors.full_messages, clock: clock})
        else
          render json: ClockSHowSerializer.new({status: 1, message: "Create clock success", clock: clock})
        end
      end

      private

      def clock_params
        params.require(:clock).permit(:is_bedtime)
      end
    end
  end
end
