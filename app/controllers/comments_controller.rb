class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @vital = Vital.find(params[:vital_id])
    @comment = @vital.comments.new(comment_params)
    @comment.save
    redirect_to vital_path(@vital), notice: 'コメントを追加'
  end

  def destroy
    @vital = Vital.find(params[:vital_id])
    @comment = @vital.comments.find(params[:id])
    @comment.destroy
    redirect_to vital_path(@vital), notice: 'コメントを削除'
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
