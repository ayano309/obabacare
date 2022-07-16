class CommentImportantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @vitals = Vital.eager_load(:comments).on_month
  end
end

