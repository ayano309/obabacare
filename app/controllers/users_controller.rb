class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
   
  #パスワード編集
  def edit
    
  end
  
  #パスワード更新
  def update
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
    
  end
  
  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
  def set_user
    @user = current_user
  end
  def password_set?
    user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
  end
end
