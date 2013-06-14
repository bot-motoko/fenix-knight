class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  private
    def authenticate
      if Rails.env.production?
        authenticate_or_request_with_http_basic('Enter Password') do |u, p|
          u == ENV['USER_TAGGABLE'] && p == ENV['PASSWORD_TAGGABLE']
        end
      end
    end
end
