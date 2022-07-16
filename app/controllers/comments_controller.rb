class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vital
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
    flash[:notice] = '解決済にしました'
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
