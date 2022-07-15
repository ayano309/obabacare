class EmotionsController < ApplicationController
  def index
    @comments = Comment.joins(:vital).by_user(current_user)
  end
end
