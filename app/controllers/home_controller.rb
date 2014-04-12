class HomeController < ApplicationController
  def index

  end

  def get_self
    mySelf = MySelf.first
    render json: mySelf
  end
end
