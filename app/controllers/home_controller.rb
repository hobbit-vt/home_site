class HomeController < ApplicationController
  layout 'front'

  def index
    @title = "::Main Page"
    @self = MySelf.first
    @years_old = (DateTime.now.to_i - @self.date_birth.to_i) / 60 / 60 / 24 / 365
  end

end
