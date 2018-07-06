class UsersController < ApplicationController
  def index
    @user = User.all()
    render :json => @user, include: "receiving.receiving_detail.item,receiving.user"
  end
end
