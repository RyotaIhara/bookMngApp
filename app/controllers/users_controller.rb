class UsersController < ApplicationController
  skip_before_action :require_sign_in!, 
    only: [:new, :create,:confirm_name, :edit_password_from_confirm_name, :edit_password, :update_password]
  before_action :set_user, only: [:edit_name, :edit_password, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit_name
    @user.user_name = ''
  end

  def edit_password
  end

  def confirm_name
    @user = User.new
  end

  def edit_password_from_confirm_name
    @user = User.find_by(user_name: user_name_param, deleted_at: nil)
    if @user.present?
      redirect_to "/users/#{@user.id}/edit_password"
    else
      @errors = ['ユーザー名が存在しません']
      render 'confirm_name'
    end
  end

  def update
    if params[:target_column] == 'user_name'
      @user.user_name = user_params["user_name"]
    elsif params[:target_column] == 'password'
      @user.password = user_params["password"]
      @user.password_confirmation = user_params["password_confirmation"]
    end

    if @user.save
      redirect_to root_path
    else
      if params[:target_column] == 'user_name'
        render 'edit_name'
      elsif params[:target_column] == 'password'
        render 'edit_password'
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end

  def user_name_param
    return params[:user_name]
  end

end
