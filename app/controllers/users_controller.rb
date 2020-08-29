class UsersController < ApplicationController
  skip_before_action :require_sign_in!, 
    only: [:new, :create,:confirm_name, :edit_password_from_confirm_name, :edit_password, :update]
  before_action :set_user, only: [:edit_name, :edit_password, :update, :destroy]

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

  # ユーザー名編集
  def edit_name
    @user.user_name = ''
  end

  # パスワード編集
  def edit_password
  end

  # パスワードを忘れた場合のユーザー確認
  def confirm_name
    @user = User.new
  end

  # ユーザー名確認後、パスワードリセット画面に遷移（パスワードを忘れた場合）
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
    puts "メソッドが動いた"
    if params[:target_column] == 'user_name'
      # ユーザーネーム編集の際はログインの必要がある
      require_sign_in!
      @user.user_name = user_params["user_name"]
    elsif params[:target_column] == 'password'
      @user.password = user_params["password"]
      @user.password_confirmation = user_params["password_confirmation"]
    end

    # 実行するバリデーションを条件に応じて変更する
    if params[:target_column] == 'user_name' ? 
      @user.save(context: :user_name_valid) : @user.save(context: :password_valid)
        redirect_to root_path
    else
      if params[:target_column] == 'user_name'
        render 'edit_name'
      elsif params[:target_column] == 'password'
        render 'edit_password'
      end
    end
  end

  def destroy
    @user.deleted_at = Date.today.to_time
    if @user.save
      sign_out
      redirect_to login_path
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
