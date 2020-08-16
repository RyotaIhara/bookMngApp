class SessionsController < ApplicationController
  skip_before_action :current_user, only: [:new, :create]
  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user.authenticate(params[:password])
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:danger] = t('.flash.invalid_password')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

    def set_user
      @user = User.find_by!(user_name: params[:user_name])
    rescue
      flash.now[:danger] = t('.flash.invalid_user_name')
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:user_name, :password)
    end
end
