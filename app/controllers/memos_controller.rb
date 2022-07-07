class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: %i[edit update]
  before_action :set_user, only: %i[index new create destroy]
  
  def index
    @memos = Vital.on_memos(@user, params[:page])
  end

  def new
    @memo = @user.memos.build
  end

  def create
    @memo = @user.memos.build(memo_params)
    if @memo.save
      redirect_to memos_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    memo = @user.memos.find(params[:id])
    memo.destroy!
    redirect_to memos_path, notice: '削除に成功しました'
  end

  private
  def memo_params
    params.require(:memo).permit(:content,:title)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
