class UserProvider

  def initialize(session)
    @session = session;
  end

  def login(user)

    result = true

    if user.valid?
      db_user = User.where(:name == user.name).first
      user.pass = Digest::SHA1.hexdigest(user.pass)

      if !db_user.nil? && db_user.pass == user.pass
        @session[:user_name] = user.name
        Rails.logger.info("User #{user.name} logged in")
      else
        result = false
        Rails.logger.info("User #{user.name} logged in failed with pass #{user.pass}")
      end
    else
      result = false
      Rails.logger.info('User logged in failed. Bad user')
    end

    return result

  end

  def logout
    @session[:user_name] = nil
  end

  def user_logged_in?
    return !@session[:user_name].nil? ? true : false
  end

  def user_name
    return @session[:user_name]
  end


end