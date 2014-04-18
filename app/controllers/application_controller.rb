require "#{Rails.root}/authenticate/user_provider.rb"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init_vars

  protected
  def user_provider
    @user_provider
  end

  private
  def init_vars
    @user_provider = UserProvider.new(session)
  end

end
