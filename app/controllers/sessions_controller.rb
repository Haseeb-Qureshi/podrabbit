class SessionsController < ApplicationController
  def new
  end

  def create
    email, password = params[:email], params[:password]
    user = User.find_by_credentials(email, password)
    if user.present?
      log_in!(user)
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to :root
  end
end
