class AuthController < ApplicationController
  layout 'front'

  def index
    @title = '::Sign in'
  end

  def login

    user = User.new(params.permit(:name, :pass))

    if user_provider.login(user)
      redirect_to controller: 'home', action: 'index'
    else
      flash['auth_error'] = 'Неа!'
      redirect_to action: 'index'
    end

  end

  def logout
    user_provider.logout
    redirect_to controller: 'home', action: 'index'
  end

end
