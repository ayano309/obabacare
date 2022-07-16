class EmotionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @comments = Comment.eager_load(:vital).by_user(current_user)
  end
end
