module AuthenticationControllerHelper
  def authenticateUsers
    if !session[:user].present?
      if request.format.symbol == :html
        flash[:error] = "You need to login first."
        redirect_to '/login'
      else
        render :json => {
          error: "Unauthorized",
          status: 401
        }, status: 401
      end
    end
  end
end
