module AuthenticationControllerHelper
  def authenticateUsers
    if !session[:user].present?
      flash[:error] = "You need to login first."
      redirect_to '/login'
    end
  end
end
