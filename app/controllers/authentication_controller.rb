class AuthenticationController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing in"
      redirect_to "/"
    else
      flash[:notice] = "Ooopps, something went wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
