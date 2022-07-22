class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vital,except: [:index]
  
  def index
    @vitals = Vital.eager_load(:comments).vitals_month(current_user)
  end
  
  def create
    @comment = @vital.comments.new(comment_params)
    @comment.user_id = current_user.id
    unless @comment.save
      render 'error'  #comments/error.js.hamlを参照する
    end

  end

  def destroy
    @comment = @vital.comments.find(params[:id])
    @comment.destroy
  end

  def update
    @comment = @vital.comments.find(params[:id])
    @comment.is_important = Comment.switch_flg(@comment.is_important)
    @comment.update(is_important: @comment.is_important)
    flash[:notice] = '変更しました'
    redirect_to comment_importants_path
  end

  private
  def set_vital
    @vital = Vital.find(params[:vital_id])
  end

  def comment_params
    params.require(:comment).permit(:content,:is_important,:emotion)
  end
end
