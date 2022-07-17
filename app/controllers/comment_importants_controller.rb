class CommentImportantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @vitals = Vital.eager_load(:comments).vitals_month(current_user)
  end
end
