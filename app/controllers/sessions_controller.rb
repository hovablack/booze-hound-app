class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid username/password'
      render :new
    end
  end

  def omniauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.uid = auth['uid']
      u.provider = auth['provider']
      u.password = SecureRandom.hex(10)
    end
    if @user.valid?
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
