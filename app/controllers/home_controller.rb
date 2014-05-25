class HomeController < ApplicationController

  def index
    @self = MySelf.first
    @years_old = (DateTime.now.to_i - @self.date_birth.to_i) / 60 / 60 / 24 / 365
  end

end
