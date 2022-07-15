class EmotionsController < ApplicationController
  def index
    @comments = Comment.eager_load(:vital).by_user(current_user)
  end
end
