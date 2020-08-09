module HttpAuthConcern  
    extend ActiveSupport::Concern
    included do
        before_action :authenticate_app
    end

  def authenticate_app
    if request.headers["AppToken"].blank? || request.headers["AppToken"] != ENV['APPTOKEN']
      errors = { error: 'Invalid Request', error_description: 'Request is not valild' }
      render json: errors, status: 401
      return
    end
  end
end