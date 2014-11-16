class AccessController < ApplicationController

  before_action :confirm_logged_in, except: [:new, :create, :attempt_login, :login, :logout, :password_reset, :forgot, :reset, :reset_password]
  before_action :prevent_login_signup, only: [:login, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if(@user.save)
      UserMailer.signup_confirmation(@user).deliver
      session[:user_id] = @user.id
      session[:is_admin] = @user.is_admin
      flash[:success] = "You are now logged in!"
      redirect_to users_path
    else
      render :new
    end

  end

  def login
  end

  def attempt_login

    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if !found_user
      flash.now[:alert] = "Invalid username"
      render :login
    elsif !authorized_user
      flash.now[:alert] = "Invalid password"
      render :login
    else
      session[:user_id] = authorized_user.id
      session[:is_admin] = authorized_user.is_admin
      flash[:success] = "You are now logged in."
      redirect_to users_path
    end

  end

  def password_reset

    if params[:username].present?
      @user = User.where(username: params[:username]).first
      @user.update_attributes(:reset_token => Random.rand(100))
      UserMailer.password_reset(@user).deliver
      redirect_to login_path
    end
  end

  def reset
    puts "RESET ACTION!!!!"
    if User.find_by_reset_token(params[:user_reset_token]).present?
      @user = User.find_by_reset_token(params[:user_reset_token])
    else
      redirect_to login_path
    end
  end


  def reset_password
    @user = User.find_by_reset_token(params[:user_reset_token])
    @user.update_attributes(user_params)
    @user.update_attributes(:reset_token => nil)
    if(@user.save)
      session[:user_id] = @user.id
      session[:is_admin] = @user.is_admin
      flash[:success] = "You're profile is updated"
      redirect_to root_path
    else
      render :reset
    end
  end


  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:is_admin] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
