class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  #ユーザー情報表示
  def show; end
    
  
  def edit; end
  
  
  def update; end
    
    
  #パスワード編集
  def edit_password; end
    
  
  #パスワード更新
  def update_password
    if password_set?
     #update_passwordメソッドをuser.rbに記述
      @user.update_password(user_params)
      flash[:notice] = "パスワードは正しく変更されました"
      redirect_to root_path
    else
      @user.errors.add(:password,"パスワードに不備があります。")
      render "edit_password"
    end
  end
  #退会(論理削除)
  def destroy
    # ユーザーが退会処理をするとき
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    @user.update(deleted_flg: @user.deleted_flg)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation,:deleted_flg)
  end
  def set_user
    @user = current_user
  end
  def password_set?
    user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
  end
end
