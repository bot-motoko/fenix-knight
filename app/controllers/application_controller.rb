class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :editable?

  private
    def authenticate
      session[:editable_for_template] = true unless Rails.env.production?

      if Rails.env.production?
        auth = authenticate_or_request_with_http_basic('Enter Password') do |u, p|
          u == ENV['USER_TAGGABLE'] && p == ENV['PASSWORD_TAGGABLE']
        end
        session[:editable_for_template] = true if auth
      end
    end

    def editable?
      !!session[:editable_for_template]
    end
end
