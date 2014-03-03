class SessionsController < ApplicationController
  def index
    @user=User.find_by_id(params[:user])
  end
   def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to :action => 'index',:params => {user: @user}
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
