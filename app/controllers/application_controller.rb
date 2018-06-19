class ApplicationController < ActionController::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :internal_server_error

  def not_found
    redirect_to root_url, alert: 'The page you were looking for doesn\'t exist.'
  end

  def internal_server_error
    redirect_to root_url, alert: 'We\'re sorry, but something went wrong.'
  end
end
