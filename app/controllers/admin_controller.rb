class AdminController < ApplicationController
  before_filter :reject_non_auth_request

  def index

  end

end
