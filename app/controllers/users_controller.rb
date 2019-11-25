class UsersController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to new_user_path
    else
      @user= User.find(session[:user_id])
        redirect_to @user
   end
end
  def show
    @user = User.find(params[:id])
    # session[:user_id] = @user.id
  end
  def login
  end
  def new
    @user = User.new
  end
  def list
    @users = User.all
  end
  def create
    @user =User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id]= @user.id
      redirect_to users_login_path
    else
      render 'new'
    end
  end
  def process_login
      user = User.authenticate(params[:name], params[:password])
     if user
        session[:user_id] = user.id
        redirect_to users_path
     else
        redirect_to users_login_path
      end
    end
    def logout
  session.delete(:current_user_id)
  @_current_user = nil
  redirect_to users_login_path
end
  private
    def user_params
      params.require(:user).permit(:name, :phone, :email, :password,:password_confirmation, :token)
    end
end
