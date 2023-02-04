module Api
  class ApiBaseController < ActionController::API
    protected

    def paginate(resource)
      @page = params[:page].to_i || 1
      @per_page = default_per_page
      resource
        .page(@page)
        .per(@per_page)
    end

    def default_per_page
      Kaminari.config.default_per_page
    end

    private

    def current_user
      user_id = session[:user_id] || 1
      @current_user ||= User.find_by(id: user_id)
      Time.zone = @current_user.time_zone
      @current_user
    end
  end
end
