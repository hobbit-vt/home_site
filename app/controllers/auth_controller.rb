class AuthController < ApplicationController

  def index
    
  end

  def login

    user = User.new(params.permit(:name, :pass))

    if user_provider.login(user)
      redirect_to controller: 'home', action: 'index'
    else
      redirect_to action: 'index'
    end

  end

  def logout
    user_provider.logout
    redirect_to controller: 'home', action: 'index'
  end

end
