class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present? && user.authenticate(params[:session][:password])
      flash[:success] = "Signed in as #{user.handle}."
      sign_in(user)
      redirect_to post_auth_path
    else
      flash.now[:alert] = "Invalid email/username & password combination."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out."
    redirect_to root_path
  end
end
