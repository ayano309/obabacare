class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"
   #ユーザーの検索機能
  def index
    
  end
  
  # ユーザーの退会処理
  def destroy
    
  end
end