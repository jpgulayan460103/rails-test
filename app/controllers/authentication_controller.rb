require 'digest/sha1'
class AuthenticationController < ApplicationController
  def login
    if session[:user].present?
      redirect_to root_path
    end
  end
  def authenticate
    username = params[:form][:username]
    password = Digest::SHA1.hexdigest(params[:form][:password])
    user = User::where(username: username, password: password).first
    if user.present?
      session[:user] = user
      session[:username] = user.username
      redirect_to root_path
    else
      flash[:error] = "Username or password is not valid."
      flash[:username] = username
      render "login"
      # render plain: "akjsdnaksjd"
    end
  end
  def logout
    session.clear
    redirect_to '/login'
  end
end
