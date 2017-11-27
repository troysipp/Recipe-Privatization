class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    puts session[:user_id]
    puts 12345

    @current_user || @current_user = User.find(session[:user_id]) if session[:user_id]

  end
  helper_method :current_user

  def authorize
    puts current_user
    puts 3333
    puts @current_user
    redirect_to signup_path, alert: "Not authorized" if current_user.nil?
  end

end
