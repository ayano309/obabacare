class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @vital = Vital.find(params[:vital_id])
    @comment = @vital.comments.new(comment_params)
    unless @comment.save
      render 'error'  #comments/error.js.hamlを参照する
    end

  end

  def destroy
    @vital = Vital.find(params[:vital_id])
    @comment = @vital.comments.find(params[:id])
    @comment.destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:content,:is_important,:emotion)
  end
end
