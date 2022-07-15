class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
   #ユーザーの検索機能
  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @users = User.search_information(@keyword).display_list(params[:pages])
    else
      @keyword = ''
      @users = User.display_list(params[:pages])
    end
  end

  # ユーザーの退会処理
  def destroy
    user = User.find(params[:id])
    #switch_flgメソッドは、与えられた引数によってtrueまたはfalseを返す。
    deleted_flg = User.switch_flg(user.deleted_flg)
    user.update(deleted_flg: deleted_flg)
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to dashboard_users_path
  end
end
