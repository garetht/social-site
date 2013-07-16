module SessionsHelper

  def login(user)
    token = SecureRandom::urlsafe_base64
    if user.update_attribute(:session_token, token)
      session[:session_token] = token
    else
      set_flash "#{user.errors.full_messages}"
    end
  end

  def logout
    session[:session_token] = nil
    current_user.update_attributes(session_token: nil)
  end

  def current_user
    if session[:session_token]
      @current_user ||= User.find_by_session_token(session[:session_token])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      set_flash "Not authorized"
      redirect_to new_session_url
    end
  end

end
